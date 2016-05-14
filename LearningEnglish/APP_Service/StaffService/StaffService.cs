using LearningEnglish.App_Data;
using LearningEnglish.DAL_Service.StaffService;
using LearningEnglish.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.APP_Service.StaffService
{
    public class StaffService
    {
        DAL_StaffService dal_staffService;
        public StaffService()
        {
            dal_staffService = new DAL_StaffService();
        }
        public  IEnumerable<staff_tbl> SearchStaffs(ref StaffParams pStaffParams)
        {
            var ret = dal_staffService.GetAllStaffs();
            return ret;
        }
    }
}