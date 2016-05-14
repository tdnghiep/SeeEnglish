using LearningEnglish.App_Business.Examination;
using LearningEnglish.App_Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.App_Business.QuestionAndAnswer
{
    public class QuestionInfo
    {
        public question_tbl question = null;
        public List<AnswerInfo> answers = null;
        public resource_tbl resource = null;
        public IEnumerable<resource_link_tbl> resource_link = null;
        public ExaminationInfo examination = null;
        public examination_question_tbl examination_question = null;
        public string examination_id = "";

        public QuestionInfo(string guid)
        {
        }

        public QuestionInfo()
        {
            // TODO: Complete member initialization
        }

        public void LoadExaminationInfo(string examination_id)
        {

        }
    }
}