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
using LearningEnglish.Constant;
using LearningEnglish.APP_Service.UserService;
using System.Threading;

namespace LearningEnglish.Controllers
{
    public class UserController : ApiController
    {
        [HttpPost]
        [Route("api/user/create")]
        public Constants.RESULT create([FromBody] UserModel user)
        {
            Constants.RESULT ret = Constants.RESULT.FAILED;
            if (user != null)
            {
                // check exist user name
                if (!String.IsNullOrEmpty(user.email))
                {
                    UserService userSv = new UserService();
                    // user name not existed
                    user_tbl userTbl = new user_tbl();
                    userTbl.first_name = user.firstName;
                    userTbl.last_name = user.lastName;
                    userTbl.email1 = user.email;
                    userTbl.user_name = user.email;
                    userTbl.password = user.password;
                    string createdate = DateTime.Now.ToString("yyyyMMdd:HHmmss");
                    userTbl.create_date = createdate;
                    userTbl.update_date = createdate;
                    if (userSv.AddNewUser(userTbl))
                    {
                        ret = Constants.RESULT.SUCCESS;
                    }
                }
            }
            return ret;
        }
    }
}
