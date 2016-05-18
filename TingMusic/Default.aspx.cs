using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using TingMusic.TingMusicWS;
using System.Net;

namespace TingMusic
{
    public partial class _Default : Page
    {
        TingMusicWS.TingMusicAPI tingMusicAPI = new TingMusicWS.TingMusicAPI();
        public string billList;
        public string name;
        public string update_date;

        protected void Page_Load(object sender, EventArgs e)
        {
            billList = tingMusicAPI.getBillList("1", 100);
            BillList bList = JsonConvert.DeserializeObject<BillList>(billList);
            name = bList.Billboard.Name;
            update_date = bList.Billboard.UpdateDate;
            gvSongList.DataSource = bList.SongList;
            gvSongList.DataBind();
        }

        protected void gvSongList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvSongList.Rows[index];
                string id = gvSongList.DataKeys[index].Values[0].ToString();
                string songLink = tingMusicAPI.getSongLink(id);
                SongLink sLink = JsonConvert.DeserializeObject<SongLink>(songLink);
                if (sLink.ErrorCode == 22000) //success
                {
                    lblTitle.Text = id;
                    rLinks.DataSource = sLink.Bitrate;
                    rLinks.DataBind();
                    ScriptManager.RegisterClientScriptBlock(pnlBody, pnlBody.GetType(), "Download", "Download()", true);
                }
                else //no link available
                {

                }
            }
        }
    }
}