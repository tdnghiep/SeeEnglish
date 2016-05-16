using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;

namespace LearningEnglish.Constant
{
    public static class Constants
    {
        #region "Params"
        public static int MaxRow = 20;
        public static int StartIndexRow = 0;
        #endregion

        #region "Constant"
        public enum RESULT
        {
            SUCCESS = 1,
            FAILED = 2,
            UNKNOW_ERROR =3
        }
        #endregion
    }

    public static class MyMutex
    {
        #region "Mutex"
        public static Mutex mutex_add_new_user = new Mutex();

        #endregion
    }
}