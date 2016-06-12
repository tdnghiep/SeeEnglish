///////////////////////////////////////////////////////////////////////////////
////
////  Copyright (C) 2015 SCREEN Graphic and Precision Solutions Co., Ltd.  All Rights Reserved.  
////
////  N O T I C E
////  THIS MATERIAL IS CONSIDERED A TRADE SECRET BY SCREEN GP.                                   
////  UNAUTHORIZED ACCESS IS PROHIBITED.
////
////////////////////////////////////////////////////////////////////////////////
//// 
////	Description		: RAP4 Web API                                               
////
////	Created	: Create EQO3.00EO003[EQO-A-0103] by nghiepdt
////
////////////////////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Security.Principal;
using System.Net.Http.Headers;
using System.Web;
using System.Threading;
using System.Web.Security;
using System.Net;

public class APIAuthHttpModule : IHttpModule
{
    private const string Realm = "RAP4";
    // to reduce access to database for checking API Key of each request, we store api key into dictionary

    public static Dictionary<string, string> dictAPIKey = new Dictionary<string, string>();
    public void Init(HttpApplication context)
    {
        // Register event handlers
        context.AuthenticateRequest += OnApplicationAuthenticateRequest;
        context.EndRequest += OnApplicationEndRequest;
    }

    private static void SetPrincipal(IPrincipal principal)
    {
        Thread.CurrentPrincipal = principal;
        if ((HttpContext.Current != null))
        {
            HttpContext.Current.User = principal;
        }
    }

    private static bool AuthenticateUser(string credentials)
    {
        dynamic encoding = System.Text.Encoding.GetEncoding("iso-8859-1");
        credentials = encoding.GetString(Convert.FromBase64String(credentials));

        dynamic credentialsArray = credentials.Split(':');
        dynamic username = credentialsArray(0);
        dynamic password = credentialsArray(1);

        MembershipUser objUser = Membership.GetUser(username);
        if (objUser != null)
        {
            if (objUser.GetPassword().ToLower() == password)
            {
                dynamic identity = new GenericIdentity(username);
                SetPrincipal(new GenericPrincipal(identity, null));
                Membership.UpdateUser(objUser);
            }
        }

        return true;
    }

    public static void OnApplicationAuthenticateRequest(object sender, EventArgs e)
    {
        var request = HttpContext.Current.Request;
        var apiKeyInput = request.Params["api_key"];
        //get client address
        string clientAddress = "";
        if (request.UrlReferrer != null)
        {
            clientAddress = request.UrlReferrer.Host;
        }
        else
        {
            clientAddress = request.UserHostAddress;
        }
        if (string.IsNullOrEmpty(clientAddress))
        {
            //user not enough permission for accessing web api 
            HttpContext.Current.Response.StatusCode = (int)HttpStatusCode.NotAcceptable;
            HttpContext.Current.Response.StatusDescription = "Error. Please contact system admin.";
            return;
        }
        //check API Key valid
        string hostname = "";
        if (!string.IsNullOrEmpty(apiKeyInput))
        {
            // api key is not stored in dictionary
            if (dictAPIKey.ContainsKey(apiKeyInput))
            {
                hostname = dictAPIKey[apiKeyInput];
            }
        }
        //check api key
        if (!string.IsNullOrEmpty(apiKeyInput) && string.Equals(hostname, clientAddress))
        {
            //success check api key, we must authenticate and authorization 
            dynamic authHeader = request.Headers["Authorization"];
            if (authHeader != null)
            {
                dynamic authHeaderVal = AuthenticationHeaderValue.Parse(authHeader);
                // RFC 2617 sec 1.2, "scheme" name is case-insensitive
                if (authHeaderVal.Scheme.Equals("basic", StringComparison.OrdinalIgnoreCase) && (authHeaderVal.Parameter != null))
                {
                    AuthenticateUser(authHeaderVal.Parameter);
                }
            }
        }
        else
        {
            //check if this request call common api to login
            string actionRouter = request.Url.LocalPath;
            actionRouter = actionRouter.ToLower();
            string method = request.HttpMethod;
            //except action of rap4 MVC
            if (actionRouter.Contains("/rap4/api/"))
            {
                if (method.ToLower() == "get" && actionRouter.Equals("/rap4/api/common", StringComparison.OrdinalIgnoreCase))
                {
                    //this request call common api to login
                    //to do some check
                }
                else
                {
                    //user not enough permission for accessing web api 
                    HttpContext.Current.Response.StatusCode = (int)HttpStatusCode.Forbidden;
                    HttpContext.Current.Response.StatusDescription = "You not allowed access to rap4 api.";
                }
            }
        }

        //Dim authHeader = request.Headers("Authorization")
        //If authHeader IsNot Nothing Then
        //    Dim authHeaderVal = AuthenticationHeaderValue.Parse(authHeader)
        //    ' RFC 2617 sec 1.2, "scheme" name is case-insensitive
        //    If authHeaderVal.Scheme.Equals("basic", StringComparison.OrdinalIgnoreCase) AndAlso Not authHeaderVal.Parameter Is Nothing Then
        //        AuthenticateUser(authHeaderVal.Parameter)
        //    End If
        //End If
    }

    // If the request was unauthorized, add the WWW-Authenticate header
    // to the response.
    private static void OnApplicationEndRequest(object sender, EventArgs e)
    {
        if (HttpContext.Current.Response.StatusCode == 401)
        {
            HttpContext.Current.Response.Headers.Add("WWW-Authenticate", string.Format("Basic realm=\"{0}\"", Realm));
        }
    }

    public void Dispose()
    {
    }
}

