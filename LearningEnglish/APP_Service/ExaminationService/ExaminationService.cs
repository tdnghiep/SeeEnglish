using LearningEnglish.App_Business.Part;
using LearningEnglish.App_Business.QuestionAndAnswer;
using LearningEnglish.App_Business.Topic;
using LearningEnglish.App_Data;
using LearningEnglish.DAL_Service.DAL_QuestionAndAnswerService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.APP_Service.ExaminationService
{
    public class ExaminationService
    {
        private DAL_QuestionAndAnswerService dal_question_answer_service = null;
        public ExaminationService()
        {
            dal_question_answer_service = new DAL_QuestionAndAnswerService();
        }
        public List<PartInfo> GetPartByExaminationID(String examination_id)
        {
            return dal_question_answer_service.GetPartByExaminationID(examination_id);
        }

        public List<TopicExaminationInfo> GetTopicByExaminationID(String examination_id)
        {
            return dal_question_answer_service.GetTopicByExaminationID(examination_id);
        }
        public List<QuestionInfo> GetQuestionByExaminationID(String examination_id)
        {
            return dal_question_answer_service.GetQuestionByExaminationID(examination_id);
        }
        public object[] GetExaminationInfoByID(String examination_id)
        {
            List<PartInfo> listPart = GetPartByExaminationID(examination_id);
            List<TopicExaminationInfo> listTopic = GetTopicByExaminationID(examination_id);
            List<QuestionInfo> listQuestion = GetQuestionByExaminationID(examination_id);
            int totalElement = 0;
            if(listPart != null)
            {
                totalElement += listPart.Count;
            }
            if(listQuestion != null)
            {
                totalElement += listQuestion.Count;
            }
            object[] array = new object[totalElement];
            foreach(var part in listPart)
            {
                if(part.examination_order < totalElement)
                {
                    array[(int)part.examination_order] = part;
                }
            }

            foreach (var topic in listTopic)
            {
                if (topic.examination_order < totalElement)
                {
                    array[(int)topic.examination_order] = topic;
                }
            }

            foreach (var question in listQuestion)
            {
                if (question.examination_question.examination_order < totalElement)
                {
                    array[(int)question.examination_question.examination_order] = question;
                }
            }
            return array;
        }
    }
}