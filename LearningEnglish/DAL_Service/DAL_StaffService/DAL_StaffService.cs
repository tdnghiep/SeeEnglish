using LearningEnglish.App_Data;
using LearningEnglish.Constant;
using LearningEnglish.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Data.Linq;
using System.Linq;
using System.Web;

namespace LearningEnglish.DAL_Service.StaffService
{
    public class DAL_StaffService
    {
        EnglishCenterDBDataContext db ;
        public DAL_StaffService()
        {
            db = new EnglishCenterDBDataContext();
        }
        /// <summary>
        /// Get all staff
        /// </summary>
        /// <param name="numRow"></param>
        /// <param name="startIndex"></param>
        /// <returns></returns>
        public IEnumerable<staff_tbl> GetAllStaffs()
        {
            Table<staff_tbl> staffTbl = db.staff_tbls;
            var ret = from t in staffTbl
                     select t;
            return ret;
        }

        public IEnumerable<staff_tbl> SearchStaffWithPaging(int numRow,int startIndex)
        {
            IEnumerable<staff_tbl> ret = null;
            if (numRow <= 0)
            {
                numRow = Constants.MaxRow;
            }
            if (startIndex <= 0)
            {
                startIndex = Constants.StartIndexRow;
            }
            ret = from t in db.staff_tbls
                  select t;
            ret = ret.Skip(startIndex).Take(numRow);
            return ret;
        }

        /// <summary>
        /// Search staff with condition
        /// </summary>
        /// <param name="pStaffParams"></param>
        /// <returns></returns>
        public IEnumerable<staff_tbl> SearchStaff(StaffParams pStaffParam)
        {
            IEnumerable<staff_tbl> ret = null;
            Table<staff_tbl> staffTbl = db.staff_tbls;
            if (pStaffParam.maxRow <= 0)
            {
                pStaffParam.maxRow = Constants.MaxRow;
            }
            if (pStaffParam.startIndex <= 0)
            {
                pStaffParam.startIndex = Constants.StartIndexRow;
            }
            var query = from t in staffTbl
                        select t;
            if (!String.IsNullOrEmpty(pStaffParam.staffName))
            {
                query = query.Where(x => x.fullname.ToLower().Contains(pStaffParam.staffName.ToLower()));
            }
            
            ret = ret.Skip(pStaffParam.startIndex).Take(pStaffParam.maxRow);
            
            
            return ret;
        }

        /// <summary>
        /// Get staff info with staff code
        /// </summary>
        /// <param name="staffCode"></param>
        /// <returns></returns>
        public staff_tbl GetStaffInfo(string staffCode)
        {
            if(! String.IsNullOrEmpty(staffCode))
            {
                var ret = from t in db.staff_tbls
                          where t.staff_code.Equals(staffCode.ToUpper())
                          select t;
                return ret.FirstOrDefault();
            }
            return null;
        }

        /// <summary>
        /// Update staff
        /// </summary>
        /// <param name="staff"></param>
        /// <returns></returns>
        public bool UpdateStaff(staff_tbl staff)
        {
            bool ret = true;


            return ret;
        }

        /// <summary>
        /// Delete staff
        /// </summary>
        /// <param name="staffCode"></param>
        /// <returns></returns>
        public bool DeleteStaff( string staffCode)
        {
            bool ret = true;


            return ret;
        }
    }
}