using LearningEnglish.Constant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.Models.SearchObject
{
    public class SearchUserObject
    {
        public string user_name = "";
        public string password = "";
        public string user_type = "";
        public int maxRow = Constants.MaxRow;
        public int current_page = 1;
        public double totalRecord = 0;
    }
}