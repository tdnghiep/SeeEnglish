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

        /// <summary>
        /// get all user acount
        /// </summary>
        /// <returns></returns>
        public IEnumerable<user_tbl> GetAllUser()
        {
            var ret = dal_userService.GetAllUser();
            return ret;
        }

        public IEnumerable<user_tbl> SearchUserCriteria(SearchUserObject userParams)
        {
            var ret = dal_userService.SearchUserCriteria(userParams);
            return ret;
        }

        /// <summary>
        /// search user with critical
        /// </summary>
        /// <param name="userParams"></param>
        /// <returns></returns>
        public IEnumerable<user_tbl> SearchUser(SearchUserObject userParams, ref int totalRecord)
        {
            var ret = dal_userService.SearchUser(userParams, ref totalRecord);
            return ret;
        }

        /// <summary>
        /// get basic info of user account
        /// </summary>
        /// <param name="user"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public IEnumerable<user_tbl> GetUserInfo(string user)
        {
            var ret = dal_userService.GetUserInfo(user);
            return ret;
        }

        /// <summary>
        /// get list role of user account
        /// </summary>
        /// <param name="role_code"></param>
        /// <returns></returns>
        public IEnumerable<role_detail_tbl> GetRoleOfUser(string role_code)
        {
            var ret = dal_userService.GetRoleOfUser(role_code);
            return ret;
        }

        /// <summary>
        /// check user account valid
        /// </summary>
        /// <param name="user"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public bool CheckAccountValid(string user, string password)
        {
            var ret = dal_userService.CheckAccountValid(user, password);
            return ret;
        }

        /// <summary>
        /// add new user
        /// </summary>
        /// <param name="user_info"></param>
        /// <returns></returns>
        public bool AddNewUser(user_tbl user_info)
        {
            var ret = dal_userService.AddNewUser(user_info);
            return ret;
        }

        /// <summary>
        /// delete user by update active field and delete_flag field
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public bool DeleteUserByUserName(string userName)
        {
            var ret = dal_userService.DeleteUserByUserName(userName);
            return ret;
        }

        /// <summary>
        /// Check user name is existed before add new user
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public bool IsExistUserName(string userName)
        {
            var ret = dal_userService.IsExistUserName(userName);
            return ret;
        }
    }
}