﻿// Generated by Xamasoft JSON Class Generator
// http://www.xamasoft.com/json-class-generator

using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace TingMusic
{

    public class Bitrate
    {

        [JsonProperty("file_bitrate")]
        public int FileBitrate { get; set; }

        [JsonProperty("file_link")]
        public string FileLink { get; set; }

        [JsonProperty("file_extension")]
        public string FileExtension { get; set; }

        [JsonProperty("original")]
        public int Original { get; set; }

        [JsonProperty("file_size")]
        public int FileSize { get; set; }

        [JsonProperty("file_duration")]
        public int FileDuration { get; set; }

        [JsonProperty("show_link")]
        public string ShowLink { get; set; }

        [JsonProperty("song_file_id")]
        public int SongFileId { get; set; }

        [JsonProperty("replay_gain")]
        public string ReplayGain { get; set; }

        [JsonProperty("free")]
        public int Free { get; set; }
    }

    public class Songinfo
    {

        [JsonProperty("artist_id")]
        public string ArtistId { get; set; }

        [JsonProperty("all_artist_id")]
        public string AllArtistId { get; set; }

        [JsonProperty("album_no")]
        public string AlbumNo { get; set; }

        [JsonProperty("pic_big")]
        public string PicBig { get; set; }

        [JsonProperty("pic_small")]
        public string PicSmall { get; set; }

        [JsonProperty("relate_status")]
        public string RelateStatus { get; set; }

        [JsonProperty("resource_type")]
        public string ResourceType { get; set; }

        [JsonProperty("copy_type")]
        public string CopyType { get; set; }

        [JsonProperty("lrclink")]
        public string Lrclink { get; set; }

        [JsonProperty("pic_radio")]
        public string PicRadio { get; set; }

        [JsonProperty("toneid")]
        public string Toneid { get; set; }

        [JsonProperty("all_rate")]
        public string AllRate { get; set; }

        [JsonProperty("play_type")]
        public string PlayType { get; set; }

        [JsonProperty("has_mv_mobile")]
        public int HasMvMobile { get; set; }

        [JsonProperty("pic_premium")]
        public string PicPremium { get; set; }

        [JsonProperty("pic_huge")]
        public string PicHuge { get; set; }

        [JsonProperty("resource_type_ext")]
        public string ResourceTypeExt { get; set; }

        [JsonProperty("bitrate_fee")]
        public string BitrateFee { get; set; }

        [JsonProperty("publishtime")]
        public string Publishtime { get; set; }

        [JsonProperty("si_presale_flag")]
        public string SiPresaleFlag { get; set; }

        [JsonProperty("song_id")]
        public string SongId { get; set; }

        [JsonProperty("title")]
        public string Title { get; set; }

        [JsonProperty("ting_uid")]
        public string TingUid { get; set; }

        [JsonProperty("author")]
        public string Author { get; set; }

        [JsonProperty("album_id")]
        public string AlbumId { get; set; }

        [JsonProperty("album_title")]
        public string AlbumTitle { get; set; }

        [JsonProperty("is_first_publish")]
        public int IsFirstPublish { get; set; }

        [JsonProperty("havehigh")]
        public int Havehigh { get; set; }

        [JsonProperty("charge")]
        public int Charge { get; set; }

        [JsonProperty("has_mv")]
        public int HasMv { get; set; }

        [JsonProperty("learn")]
        public int Learn { get; set; }

        [JsonProperty("song_source")]
        public string SongSource { get; set; }

        [JsonProperty("piao_id")]
        public string PiaoId { get; set; }

        [JsonProperty("korean_bb_song")]
        public string KoreanBbSong { get; set; }

        [JsonProperty("mv_provider")]
        public string MvProvider { get; set; }

        [JsonProperty("special_type")]
        public int SpecialType { get; set; }
    }

    public class SongLink
    {

        [JsonProperty("error_code")]
        public int ErrorCode { get; set; }

        [JsonProperty("bitrate")]
        public Bitrate[] Bitrate { get; set; }

        [JsonProperty("songinfo")]
        public Songinfo Songinfo { get; set; }
    }

}
