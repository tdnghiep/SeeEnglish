using LearningEnglish.App_Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.App_Business.QuestionAndAnswer
{
    public class AnswerInfo
    {
        public String MySelf = "answer";
        public answer_tbl answer = null;
        public resource_tbl resource = null;
        public IEnumerable<resource_link_tbl> resource_link = null;
    }
}