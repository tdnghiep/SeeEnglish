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
        public LogginModel Create([FromBody] RegisterModel user)
        {
            LogginModel ret = new LogginModel();
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
                    string create_date = DateTime.Now.ToString(Constants.DateTimeFormat);
                    userTbl.create_date = create_date;
                    userTbl.update_date = create_date;
                    userTbl.delete_flag = false;
                    if (userSv.AddNewUser(userTbl))
                    {
                        ret.isLogged = true;
                        ret.email = user.email;
                        ret.username = user.email;
                        ret.password = user.password;
                        ret.firstName = user.firstName;
                        ret.lastName = user.lastName;
                    }
                }
            }
            return ret;
        }


        [HttpPost]
        [Route("api/user/login")]
        public LogginModel Login([FromBody] UserModelBase user)
        {
            LogginModel ret = new LogginModel();
            if (String.IsNullOrEmpty(user.username) || String.IsNullOrEmpty(user.password))
            {
                ret.hasError = true;
                ret.errMsg = "Invalid user or password!";
                return ret;
            }

            UserService service = new UserService();
            if(service.CheckAccountValid(user.username,user.password))
            {
                ret.hasError = false;
                ret.isLogged = true;
                ret.email = user.email;
                ret.firstName = user.firstName;
                ret.lastName = user.lastName;
                ret.username = user.username;
            }

            return ret;
        }
    }
}
