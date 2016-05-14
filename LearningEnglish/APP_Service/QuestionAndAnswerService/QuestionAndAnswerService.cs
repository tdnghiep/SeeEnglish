using LearningEnglish.App_Business.QuestionAndAnswer;
using LearningEnglish.App_Data;
using LearningEnglish.DAL_Service.DAL_QuestionAndAnswerService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.APP_Service.QuestionAndAnswerService
{
    public class QuestionAndAnswerService
    {
        private DAL_QuestionAndAnswerService dal_question_answer_service= null;
        public QuestionAndAnswerService()
        {
            dal_question_answer_service = new DAL_QuestionAndAnswerService();
        }

        /// <summary>
        /// get all question
        /// </summary>
        /// <returns></returns>
        public IEnumerable<question_tbl> GetAllQuestion()
        {
            return dal_question_answer_service.GetAllQuestion();
        }


        /// <summary>
        /// Check a question is existed in db
        /// </summary>
        /// <param name="question_id"></param>
        /// <returns></returns>
        public bool CheckQuestionExisted(string question_id)
        {
            return dal_question_answer_service.CheckQuestionExisted(question_id);
        }

        /// <summary>
        /// get question info
        /// </summary>
        /// <returns></returns>
        public QuestionInfo GetQuestionInfo(string question_id)
        {
            return dal_question_answer_service.GetQuestionInfo(question_id);
        }



        /// <summary>
        /// add  new question
        /// </summary>
        /// <param name="question"></param>
        /// <returns></returns>
        public bool AddNewQuestion(QuestionInfo question )
        {
            return dal_question_answer_service.AddNewQuestion( question );
        }


        /// <summary>
        /// get all answer of the question
        /// </summary>
        /// <param name="question_id"></param>
        /// <returns></returns>
        public IEnumerable<answer_tbl> GetAnswersOfQuestion(string question_id)
        {
            return dal_question_answer_service.GetAnswersOfQuestion( question_id);
        }

        /// <summary>
        ///  check answer is existed
        /// </summary>
        /// <param name="answer_id"></param>
        /// <returns></returns>
        public bool CheckAnswerExisted(string answer_id)
        {
            return dal_question_answer_service.CheckAnswerExisted( answer_id);
        }

        /// <summary>
        /// add new answer of the question
        /// </summary>
        /// <param name="question_id"></param>
        /// <returns></returns>
        public bool AddNewAnswersOfQuestion(IEnumerable<answer_tbl> answers)
        {
            return dal_question_answer_service.AddNewAnswersOfQuestion( answers);
        }

        /// <summary>
        /// update answer of the question
        /// </summary>
        /// <param name="question_id"></param>
        /// <returns></returns>
        public bool UpdateAnswersOfQuestion(IEnumerable<answer_tbl> answers)
        {
            return dal_question_answer_service.UpdateAnswersOfQuestion(answers);
        }
    }
}