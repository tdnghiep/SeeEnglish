using LearningEnglish.App_Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.App_Business.Resource
{
    public class ResourceInfo
    {
        public resource_tbl resource = null;
        public List<resource_link_tbl> resource_link = null;
        public ResourceInfo()
        {

        }
        public static bool CheckLinkActive()
        {
            bool ret = false;
            try
            {
                // check link here
                ret = true;
            }
            catch(Exception ex)
            {

            }
            return ret;
        }
    }
}