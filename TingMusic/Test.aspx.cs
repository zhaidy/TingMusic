using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TingMusic.TingMusicWS;

namespace TingMusic
{
    public partial class Test : System.Web.UI.Page
    {
        TingMusicWS.TingMusicAPI tingMusicAPI = new TingMusicWS.TingMusicAPI();
        protected void Page_Load(object sender, EventArgs e)
        {
            string songLink = tingMusicAPI.getSongLink("265051234");
            SongLink sLink = JsonConvert.DeserializeObject<SongLink>(songLink);
            if (sLink.ErrorCode == 22000) //success
            {
                rLinks.DataSource = sLink.Bitrate;
                rLinks.DataBind();
                foreach (Bitrate b in sLink.Bitrate)
                {
                    if (b.FileExtension == "mp3" && b.ShowLink.Length > 0)
                    {
                        string localFile = Path.Combine(HttpContext.Current.Server.MapPath("Sound"), sLink.Songinfo.SongId + "." + b.FileExtension);
                        WebClient wc = new WebClient();
                        wc.DownloadFile(b.ShowLink, localFile);
                        break;
                    }
                }
            }
            else //no link available
            {

            }
        }
    }
}