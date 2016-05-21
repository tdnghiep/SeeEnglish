using LearningEnglish.App_Business.Resource;
using LearningEnglish.App_Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.App_Business.Topic
{
    public class TopicExaminationInfo
    {
        public String MySelf = "topic";
        public String ExaminationID = "";
        public int examination_order = 0;
        public topic_tbl TopicTbl = null;
        public ResourceInfo resource;
        public TopicExaminationInfo()
        {

        }
        public ResourceInfo GetResource(string resource_id)
        {
            ResourceInfo resource = null;
            // call service

            return resource;
        }
    }
}