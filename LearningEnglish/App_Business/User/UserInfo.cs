using LearningEnglish.App_Business.QuestionAndAnswer;
using LearningEnglish.App_Business.Role;
using LearningEnglish.App_Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.App_Business.User
{
    public class UserInfo
    {
        public user_tbl information = null;
        public RoleInfo roleInfo = null;
        public List<AnswerInfo> answerQuestion = null;
        public bool isExisted = false;

        public UserInfo(string userName, string passWord)
        {
            InitObjectValue();
        }

        private void InitObjectValue()
        {

        }
        public void LoadQuestionInfo()
        {

        }
    }
}