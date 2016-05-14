using LearningEnglish.Constant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.Models
{
    public class StaffParams
    {
        public string staff_code ="";
        public string staffName = "";
        public int maxRow = Constants.MaxRow;
        public int startIndex = Constants.StartIndexRow;
        public double totalRecord = 0;
    }
}