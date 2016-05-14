using LearningEnglish.App_Data;
using LearningEnglish.DAL_Service.DAL_UserService;
using LearningEnglish.Models.SearchObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.APP_Service.UserService
{
    public class UserService
    {
        DAL_UserService dal_userService;
        public UserService()
        {
            dal_userService = new DAL_UserService();
        }
        public IEnumerable<user_tbl> GetUserInfo(string user)
        {
            var ret = dal_userService.GetUserInfo(user);
            return ret;
        }

        public IEnumerable<role_detail_tbl> GetUserRole(string role_code)
        {
            IEnumerable<role_detail_tbl> ret = dal_userService.GetRoleOfUser(role_code);
            return ret;
        }

        public IEnumerable<user_tbl> SearchUser(SearchUserObject userParams, ref int totalRecord)
        {
            var ret = dal_userService.SearchUser(userParams,ref totalRecord);
            return ret;
        }
    }
}