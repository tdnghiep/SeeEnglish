using LearningEnglish.App_Data;
using LearningEnglish.APP_Service.QuestionAndAnswerService;
using LearningEnglish.APP_Service.StaffService;
using LearningEnglish.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace LearningEnglish.Controllers
{
    public class StaffController : ApiController
    {
        public dynamic Get([FromUriAttribute] StaffParams staff_params)
        {
            StaffService staff = new StaffService();
            IEnumerable<staff_tbl> ret = staff.SearchStaffs(ref staff_params);
            dynamic wrap = new System.Dynamic.ExpandoObject();
            wrap.list = ret;
            wrap.totalRecord = 10;
            return wrap;
        }
    }
}
