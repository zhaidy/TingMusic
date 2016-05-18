using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using Newtonsoft.Json;

namespace TingMusic
{
    /// <summary>
    /// Summary description for TingMusicServices
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class TingMusicAPI : System.Web.Services.WebService
    {
        public static string url = "http://tingapi.ting.baidu.com/v1/restserver/ting?from=webapp_music&format=json&callback=&method=";

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string getBillList(string type, int size)
        {
            string method = "baidu.ting.billboard.billList";
            string param = appendParam("type", type) + appendParam("size", size.ToString());
            return SendRequest(method, param);
        }

        [WebMethod]
        public string getSongLink(string songId)
        {
            string method = "baidu.ting.song.downWeb";
            string param = appendParam("songid", songId);
            return SendRequest(method, param);
        }

        [WebMethod]
        public string getPlayLink(string songId)
        {
            string method = "baidu.ting.song.play";
            string param = appendParam("songid", songId);
            return SendRequest(method, param);
        }

        private string SendRequest(string method, string param)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url + method + param);
            WebResponse response = request.GetResponse();
            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream, Encoding.UTF8);
            return reader.ReadToEnd();
        }
        private string appendParam(string param, string value)
        {
            return "&" + param + "=" + value;
        }
    }
}