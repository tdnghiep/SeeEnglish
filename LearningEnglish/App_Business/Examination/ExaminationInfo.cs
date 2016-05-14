using LearningEnglish.App_Business.QuestionAndAnswer;
using LearningEnglish.App_Data;
using LearningEnglish.APP_Service.QuestionAndAnswerService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.App_Business.Examination
{
    public class ExaminationInfo
    {
        public examination_tbl examination = null;
        public IEnumerable<examination_part_tbl> examination_part = null;
        public List<QuestionInfo> questions = null;
       
        public ExaminationInfo()
        {
            
        }
    }
}