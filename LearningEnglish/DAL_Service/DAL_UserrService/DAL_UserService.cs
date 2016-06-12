using LearningEnglish.App_Data;
using LearningEnglish.Constant;
using LearningEnglish.Models.SearchObject;
using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Threading;
using System.Web;

namespace LearningEnglish.DAL_Service.DAL_UserService
{
    public class DAL_UserService
    {
        EnglishCenterDBDataContext db ;
        Mutex mutext_add_new_user = null;
        public DAL_UserService()
        {
            db = new EnglishCenterDBDataContext();
            
        }

        /// <summary>
        /// get all user acount
        /// </summary>
        /// <returns></returns>
        public IEnumerable<user_tbl> GetAllUser()
        {
            IEnumerable<user_tbl> ret =null;
            try
            {
                Table<user_tbl> userTbl = db.user_tbls;
                ret = from t in userTbl
                          select t;
                return ret;
            }
            catch(Exception ex)
            {

            }
            return ret;
        }

        /// <summary>
        /// search user with critical
        /// </summary>
        /// <param name="userParams"></param>
        /// <returns></returns>
        public IEnumerable<user_tbl> SearchUserCriteria(SearchUserObject userParams)
        {
            IEnumerable<user_tbl> ret = null;
            try
            {
                Table<user_tbl> userTbl = db.user_tbls;
                var query = from t in userTbl
                      select t;
                if (!String.IsNullOrEmpty(userParams.user_name))
                {
                    query = query.Where(u => u.user_name.Contains(userParams.user_name));
                }
                if (!String.IsNullOrEmpty(userParams.password))
                {
                    query = query.Where(u => u.password.Equals(userParams.password));
                }
                if (!String.IsNullOrEmpty(userParams.user_type))
                {
                    query = query.Where(u => u.user_type.Equals(userParams.user_type));
                }
                return ret;
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        /// <summary>
        /// search user with critical
        /// </summary>
        /// <param name="userParams"></param>
        /// <returns></returns>
        public IEnumerable<user_tbl> SearchUser(SearchUserObject userParams,ref int totalRecord)
        {
            IEnumerable<user_tbl> ret = SearchUserCriteria(userParams);
            totalRecord = 0;
            // get total record && paging record
            if(ret != null)
            {
                totalRecord = ret.Count();
                int skipRecord = 0;
                int maxRow = Constants.MaxRow;
                if(userParams.maxRow > 0)
                {
                    maxRow = userParams.maxRow;
                }
                if(userParams.current_page > 0)
                {
                    skipRecord = (userParams.current_page - 1) * maxRow;
                }

                ret = ret.OrderByDescending(u => u.user_name).Skip(skipRecord).Take(maxRow);
            }
            
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
            IEnumerable<user_tbl> ret = null;
            try
            {
                Table<user_tbl> userTbl = db.user_tbls;
                ret = from t in userTbl
                      where t.user_name.Equals(user)
                      select t;
                return ret;
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        /// <summary>
        /// get list role of user account
        /// </summary>
        /// <param name="role_code"></param>
        /// <returns></returns>
        public IEnumerable<role_detail_tbl> GetRoleOfUser(string role_code)
        {
            IEnumerable<role_detail_tbl> ret = null;
            try
            {
                Table<role_detail_tbl> userTbl = db.role_detail_tbls;
                ret = from t in userTbl
                      where t.role_code.Equals(role_code)
                      select t;
                return ret;
            }
            catch (Exception ex)
            {

            }
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
            bool ret = false;
            try
            {
                Table<user_tbl> userTbl = db.user_tbls;
                var query  = from t in userTbl
                      where t.user_name.Equals(user)
                            && t.password.Equals(password)
                            && t.delete_flag == false
                      select t;
                if(query != null)
                {
                    if(query.Count() == 1)
                    {
                        ret = true;
                    }
                }
            }
            catch(Exception ex)
            {

            }

            return ret;
        }

        /// <summary>
        /// add new user
        /// </summary>
        /// <param name="user_info"></param>
        /// <returns></returns>
        public bool AddNewUser(user_tbl user_info)
        {
            bool ret = false;
            try
            {
                AddUserMutex.mutex_add_new_user.WaitOne();
                // check user name existed
                if(!IsExistUserName(user_info.user_name))
                {
                    db.user_tbls.InsertOnSubmit(user_info);
                    db.SubmitChanges();
                    ret = true;
                }
            }
            catch(Exception ex)
            {
                ret = false;
            }
            finally
            {
                AddUserMutex.mutex_add_new_user.ReleaseMutex();
            }
            return ret;
        }

        /// <summary>
        /// delete user by update active field and delete_flag field
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public bool DeleteUserByUserName(string userName)
        {
            bool ret = false;
            try
            {
                user_tbl user = (from x in db.user_tbls
                              where x.user_name.Equals(userName)
                              select x).First();
                if (user != null)
                {
                    user.active = false;
                    user.delete_flag = false;
                    db.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception ex)
            {
                ret = false;
            }
            return ret;
        }

        /// <summary>
        /// Check user name is existed before add new user
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public bool IsExistUserName(string userName)
        {
            bool ret = false;
            try
            {
                Table<user_tbl> userTbl = db.user_tbls;
                var query = from t in userTbl
                            where t.user_name.Equals(userName)
                            select t;
                if (query != null)
                {
                    if (query.Count() >= 1)
                    {
                        ret = true;
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return ret;
        }
    }
}