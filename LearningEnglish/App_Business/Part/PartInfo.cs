using LearningEnglish.App_Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.App_Business.Part
{
    public class PartInfo
    {
        public String ExaminationID = "";
        public int examination_order = 0;
        public part_tbl partTbl = null;
        public PartInfo()
        {

        }
    }
}