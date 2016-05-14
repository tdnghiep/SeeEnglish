using LearningEnglish.App_Business.Part;
using LearningEnglish.App_Business.QuestionAndAnswer;
using LearningEnglish.App_Business.Resource;
using LearningEnglish.App_Business.Topic;
using LearningEnglish.App_Data;
using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace LearningEnglish.DAL_Service.DAL_QuestionAndAnswerService
{
    public class DAL_QuestionAndAnswerService
    {
         EnglishCenterDBDataContext db = null;
        public DAL_QuestionAndAnswerService()
        {
            db = new EnglishCenterDBDataContext();
        }
        private void CreateNewDatabase()
        {
            try
            {
                EnglishCenterDBDataContext dc = new EnglishCenterDBDataContext();
                dc.CreateDatabase();
            }
            catch (Exception ex)
            {
                int a = 0;
            }
            
        }
        /// <summary>
        /// get all question
        /// </summary>
        /// <returns></returns>
        public IEnumerable<question_tbl> GetAllQuestion()
        {
            IEnumerable<question_tbl> ret = null;
            try
            {
                Table<question_tbl> questionTbl = db.question_tbls;
                ret = from t in questionTbl
                          select t;
                return ret;
            }
            catch(Exception ex)
            {

            }
            return ret;
        }

        /// <summary>
        /// Check a question is existed in db
        /// </summary>
        /// <param name="question_id"></param>
        /// <returns></returns>
        public bool CheckQuestionExisted(string question_id)
        {
            bool ret = false;
            try
            {
                Table<question_tbl> questionTbl = db.question_tbls;
                var query = from question in questionTbl
                            where question.question_id.Equals(question_id)
                            select question;
                if(query != null && query.Count() == 1)
                {
                    ret = true;
                }
            }
            catch(Exception ex)
            {

            }
            return ret;

        }

        /// <summary>
        ///  get resource link with resource_id
        /// </summary>
        /// <param name="resource_id"></param>
        /// <returns></returns>
        public IEnumerable< resource_link_tbl> GetResourceLink(string resource_id)
        {
            IEnumerable<resource_link_tbl> ret = null;
            try
            {
                Table<resource_link_tbl> rsLinkTbl = db.resource_link_tbls;
                var query = from rs in rsLinkTbl
                            where rs.resource_id.Equals(resource_id)
                            select rs;
                ret = query;
            }
            catch(Exception ex)
            {

            }
            return ret;
        }

        public ResourceInfo GetResourceInfo(string resource_id)
        {
            ResourceInfo ret = null;
            try
            {
                Table<resource_tbl> resourceTbl = db.resource_tbls;
                Table<resource_link_tbl> resourceLinkTbl = db.resource_link_tbls;

                var query = from rs in resourceTbl
                            join rslink in resourceLinkTbl on rs.resource_id equals rslink.resource_id
                            where rs.resource_id.Equals(resource_id)
                            select new {Resource = rs, RsLink = rslink };
                if(query != null)
                {
                    ret = new ResourceInfo();
                    List<resource_link_tbl> listLink = new List<resource_link_tbl>();
                    for (int i = 0;i<query.Count();i++)
                    {
                        if(i == 0)
                        {
                            ret.resource = query.ElementAt(i).Resource;
                        }
                        listLink.Add(query.ElementAt(i).RsLink);
                    }
                    ret.resource_link = listLink;
                }
            }
            catch(Exception ex)
            {

            }
            return ret;
        }


        /// <summary>
        /// get question info
        /// </summary>
        /// <returns></returns>
        public QuestionInfo GetQuestionInfo(string question_id)
        {
            QuestionInfo questionInfo = new QuestionInfo();
            try
            {
                Table<question_tbl> questionTbl = db.question_tbls;
                Table<answer_tbl> answerTbl = db.answer_tbls;
                // get question info first
                var query = from question in questionTbl
                            where question.question_id.Equals(question_id)
                            select question;

                if(query != null)
                {
                    questionInfo.question = query.FirstOrDefault();
                    if(questionInfo.question != null)
                    {
                        questionInfo.examination_id = questionInfo.question.examination_id;
                        // get resource for question
                        if (!String.IsNullOrEmpty(questionInfo.question.resource_id))
                        {
                            questionInfo.resource_link = GetResourceLink(questionInfo.question.resource_id);
                        }
                    }
                    
                    // get answer of question
                    var query2 = from question in questionTbl
                                 join answer in answerTbl
                                 on question.question_id equals answer.question_id
                                 where question.question_id.Equals(question_id)
                                 select answer;
                    
                    if(query2 != null)
                    {
                        if(questionInfo.answers == null)
                        {
                            questionInfo.answers = new List<AnswerInfo>();
                        }
                        foreach(var ans in query2)
                        {
                            AnswerInfo answer = new AnswerInfo();
                            answer.answer = ans;
                            answer.resource_link = GetResourceLink(ans.resource_id);
                            questionInfo.answers.Add(answer);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return questionInfo;
        }

        /// <summary>
        /// get all question by examination_id
        /// </summary>
        /// <param name="examination_id"></param>
        /// <returns></returns>
        public List<QuestionInfo> GetQuestionByExaminationID(String examination_id)
            {
                List<QuestionInfo> ret = new List<QuestionInfo>();
                try
                {
                    Table<examination_question_tbl> exam_question = db.examination_question_tbls;
                    var query = from ex in exam_question
                                where ex.examination_id.Equals(examination_id)
                                select ex;
                    if (query != null)
                    {
                        foreach (var q in query)
                        {
                            if (!String.IsNullOrEmpty(q.question_id))
                            {
                                QuestionInfo question = GetQuestionInfo(q.question_id);
                                if (question != null)
                                {
                                    question.examination_question = q;
                                    ret.Add(question);
                                }

                            }
                        }
                        ret = ret.OrderBy(q => q.examination_question.examination_order).ToList();
                    }
                }
                catch (Exception ex)
                {

                }
                return ret;
            }

        /// <summary>
        /// Get Part By ExaminationID
        /// </summary>
        /// <param name="examination_id"></param>
        /// <returns></returns>
        public List<PartInfo> GetPartByExaminationID(String examination_id)
        {
            List<PartInfo> ret = new List<PartInfo>();

            try
            {
                Table<examination_part_tbl> ex_partTbl = db.examination_part_tbls;
                Table<part_tbl> partTbl = db.part_tbls;
                // get question info first
                var query = from expart in ex_partTbl
                            join part in partTbl on expart.part_id equals part.part_id
                            where expart.examination_id.Equals(examination_id)
                            select new {ExPart = expart, Part = part };

                if (query != null)
                {
                    foreach (var q in query)
                    {
                        if (!String.IsNullOrEmpty(q.ExPart.part_id))
                        {
                            PartInfo info = new PartInfo();
                            info.ExaminationID = examination_id;
                            info.examination_order = (int)q.ExPart.examination_order;
                            info.partTbl = q.Part;
                            ret.Add(info);
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                
            }
            return ret;
        }


        /// <summary>
        /// Get Topic By ExaminationID
        /// </summary>
        /// <param name="examination_id"></param>
        /// <returns></returns>
        public List<TopicExaminationInfo> GetTopicByExaminationID(String examination_id)
        {
            List<TopicExaminationInfo> ret = new List<TopicExaminationInfo>();
            try
            {
                Table<examination_topic_tbl> topic_exam = db.examination_topic_tbls;
                Table<topic_tbl> topicTbl = db.topic_tbls;

                var query = from ex_tp in topic_exam
                            join tp in topicTbl on ex_tp.topic_id equals tp.topic_id
                            where ex_tp.examination_id.Equals(examination_id)
                            select new  { exTp = ex_tp, Tp = tp };
                if (query != null)
                {
                    foreach (var q in query)
                    {
                        if (!String.IsNullOrEmpty(q.exTp.topic_id))
                        {
                            TopicExaminationInfo info = new TopicExaminationInfo();
                            info.ExaminationID = examination_id;
                            info.examination_order =(int) q.exTp.examination_order;
                            info.TopicTbl = q.Tp;
                            ret.Add(info);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        /// <summary>
        /// add  new question
        /// </summary>
        /// <param name="question"></param>
        /// <returns></returns>
        public bool AddNewQuestion(QuestionInfo question )
        {
            bool ret = false;
            try
            {
                if(question.question != null)
                {
                    db.question_tbls.InsertOnSubmit(question.question);
                    if (question.answers != null)
                    {
                        foreach(var answer in question.answers)
                        {
                            db.answer_tbls.InsertOnSubmit(answer.answer);
                            if(answer.resource_link != null)
                            {
                                db.resource_link_tbls.InsertAllOnSubmit(answer.resource_link);
                            }
                        }
                        
                    }
                    if(question.resource != null)
                    {
                        db.resource_tbls.InsertOnSubmit(question.resource);
                        if (question.resource_link != null)
                        {
                            db.resource_link_tbls.InsertAllOnSubmit(question.resource_link);
                        }
                    }
                    // submit to add new record
                    db.SubmitChanges();
                    ret = true;
                }
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        /// <summary>
        /// get all answer of the question
        /// </summary>
        /// <param name="question_id"></param>
        /// <returns></returns>
        public IEnumerable<answer_tbl> GetAnswersOfQuestion(string question_id)
        {
            IEnumerable<answer_tbl> ret = null;
            try
            {
                Table<answer_tbl> questionTbl = db.answer_tbls;
                ret = from t in questionTbl
                      where t.question_id.Equals(question_id)
                      select t;
                return ret;
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        /// <summary>
        ///  check answer is existed
        /// </summary>
        /// <param name="answer_id"></param>
        /// <returns></returns>
        public bool CheckAnswerExisted(string answer_id)
        {
            bool ret = false;
            try
            {
                Table<answer_tbl> answerTbl = db.answer_tbls;
                var query = from answer in answerTbl
                            where answer.answer_id.Equals(answer_id)
                            select answer;
                if (query != null && query.Count() == 1)
                {
                    ret = true;
                }
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        /// <summary>
        /// add new answer of the question
        /// </summary>
        /// <param name="question_id"></param>
        /// <returns></returns>
        public bool AddNewAnswersOfQuestion(IEnumerable<answer_tbl> answers)
        {
            bool ret = false;
            try
            {
                db.answer_tbls.InsertAllOnSubmit(answers);
                ret = true;
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        /// <summary>
        /// update answer of the question
        /// </summary>
        /// <param name="question_id"></param>
        /// <returns></returns>
        public bool UpdateAnswersOfQuestion(IEnumerable<answer_tbl> answers)
        {
            bool ret = false;
            try
            {
                foreach (var an in answers)
                {
                    var query = from a in db.answer_tbls
                                where a.answer_id.Equals(an.answer_id)
                                select a;
                    if (query != null)
                    {
                        foreach (var answer in query)
                        {
                            if (!string.IsNullOrEmpty(an.answer_content))
                            {
                                answer.answer_content = an.answer_content;
                            }
                            if (!string.IsNullOrEmpty(an.notes))
                            {
                                answer.notes = an.notes;
                            }
                            if (!string.IsNullOrEmpty(an.question_id))
                            {
                                answer.question_id = an.question_id;
                            }
                        }
                        db.answer_tbls.Context.SubmitChanges();
                        ret = true;
                    }
                }


            }
            catch (Exception ex)
            {

            }
            return ret;
        }
    }
}