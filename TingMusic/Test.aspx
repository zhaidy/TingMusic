<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Test.aspx.cs" Inherits="TingMusic.Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        /*
DONE:
- play/pause;
- volume;
- progress bar.

TODO:
- backward/forward;
- repeat/shuffle;
- lyrics;
- playlist.
*/

        var audio = document.getElementById('audio');
        var progress = document.getElementById('progress');
        var playpause = document.getElementById("play-pause");
        var volume = document.getElementById("volume");

        audio.controls = false;

        audio.addEventListener('timeupdate', function () {
            updateProgress();
        }, false);

        function togglePlayPause() {
            if (audio.paused || audio.ended) {
                playpause.title = "Pause";
                playpause.innerHTML = '<i class="fa fa-pause fa-3x"></i>';
                audio.play();
            } else {
                playpause.title = "Play";
                playpause.innerHTML = '<i class="fa fa-play fa-3x"></i>';
                audio.pause();
            }
        }

        function setVolume() {
            audio.volume = volume.value;
        }

        function updateProgress() {
            var percent = Math.floor((100 / audio.duration) * audio.currentTime);
            progress.value = percent;
            var canvas = document.getElementById('progress');
            var context = canvas.getContext('2d');
            var centerX = canvas.width / 2;
            var centerY = canvas.height / 2;
            var radius = 150;
            var circ = Math.PI * 2;
            var quart = Math.PI / 2;
            var cpercent = percent / 100; /* current percent */
            context.beginPath();
            context.arc(centerX, centerY, radius, 0, ((circ) * cpercent), false);
            context.lineWidth = 10;
            context.strokeStyle = '#26C5CB';
            context.stroke();
            if (audio.ended) resetPlayer();
        }

        function resetPlayer() {
            audio.currentTime = 0; context.clearRect(0, 0, canvas.width, canvas.height);
            playpause.title = "Play";
            playpause.innerHTML = '<i class="fa fa-play fa-3x"></i>';
        }

        // thx to: http://www.adobe.com/devnet/html5/articles/html5-multimedia-pt3.html

    </script>

    <div class="page-header">
        265051234
    </div>
    <asp:Repeater runat="server" ID="rLinks">
        <ItemTemplate>
            <a href="<%# Eval("FileLink") %>"><%# Eval("FileLink") %></a>
        </ItemTemplate>
    </asp:Repeater>
    <audio controls="controls">
        <source src="Sound/265051234.mp3" type="audio/mp3" />
    </audio>

    <!-- Audio player -->
    <div id="container">
	<label class="to-back-label" for="to-back"><i class="fa fa-bars fa-lg"></i></label>
	<input type="checkbox" id="to-back"><!-- playlist toggle -->
	<canvas id="progress" width="320" height="320"></canvas><!-- progress bar -->
	<div id="player">
		<audio id="audio" controls>
			<source src="http://storage-new.newjamendo.com/download/track/705190/mp32/Abi_-_Abitude.mp3" type="audio/mpeg" codecs="mp3"></source>		
		</audio>
		<img src="http://imgjam1.jamendo.com/albums/s82/82250/covers/1.300.jpg"><!-- album cover -->
		<label class="to-lyrics-label" for="to-lyrics"><i class="fa fa-caret-down fa-lg"></i></label>
		<input type="checkbox" id="to-lyrics"><!-- lyrics toggle -->
		<div class="cover">
			<div class="controls">
				<button id="backward" title="Backward"><i class="fa fa-retweet fa-lg"></i></button>
				<button id="backward" title="Backward"><i class="fa fa-backward fa-2x"></i></button>
				<button id="play-pause" title="Play" onclick="togglePlayPause()"><i class="fa fa-play fa-3x"></i></button>
				<button id="forward" title="Forward"><i class="fa fa-forward fa-2x"></i></button>
				<button id="backward" title="Backward"><i class="fa fa-random fa-lg"></i></button>
				<input id="volume" name="volume" min="0" max="1" step="0.1" type="range" onchange="setVolume()" />
			</div><!-- #controls -->
			<div class="info">
				<p class="song"><a href="http://www.jamendo.com/en/track/705190/abitude" target="_blank">Abitude</a></p>
				<p class="author"><a href="http://www.jamendo.com/en/artist/365579/abi" target="_blank">Abi</a></p>
			</div><!-- #info -->
			<div class="lyrics">
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				<p>Donec vulputate nec leo vel tincidunt.</p>
				<p>Pellentesque urna massa, volutpat eu viverra in, dignissim in diam.</p>
				<p>Nullam laoreet aliquet pellentesque.</p>
				<p>Duis varius augue eu sem fringilla dignissim.</p>
				<p>Cras ligula erat, suscipit ac arcu vel, consectetur mollis nulla.</p>
				<p>Pellentesque aliquam tortor in mollis pharetra.</p>
				<p>Vestibulum consequat lacinia blandit.</p>
				<p>Sed sodales semper nibh pulvinar viverra.</p>
				<p>Pellentesque id magna ipsum. In hac habitasse platea dictumst.</p>
				<p>Aliquam lorem lectus, consequat eget fermentum eget, posuere vel dolor.</p>
				<p>Sed vel tellus gravida, bibendum lacus at, convallis est.</p>
				<p>Duis cursus purus a ligula gravida pulvinar.</p>
				<p>Vivamus vitae sem aliquet, interdum orci id, viverra dui.</p>
				<p>Etiam at laoreet justo, eget congue neque.</p>
				<p>Morbi tempor semper sem malesuada iaculis.</p>
				<p>Aenean condimentum massa sit amet venenatis ultricies.</p>
				<p>Fusce urna justo, interdum at purus sit amet, sagittis tristique orci.</p>
				<p>Nunc nibh tellus, pretium at diam sit amet, vestibulum tincidunt mauris.</p>
				<p>Curabitur in augue et nisi adipiscing ultrices.</p>
				<p>Proin cursus in quam in ullamcorper.</p>
				<p>Mauris laoreet sodales magna a mollis.</p>
				<p>Maecenas elementum porttitor dolor nec auctor.</p>
				<p>Praesent dignissim elit et turpis facilisis, ut sagittis metus congue.</p>
				<p>Curabitur quis augue pulvinar, condimentum ante et, sollicitudin justo.</p>
				<p>Ut interdum ut erat nec egestas.</p>
				<p>Ut a lectus a justo euismod sodales.</p>
			</div><!-- #lyrics -->
			<p class="scroll">scroll down</p>
		</div><!-- #cover -->
	</div><!-- #player -->
	<div id="flip-back">
		<ul class="playlist">
			<h3>The AbiStory</h3>
			<li><a href="#">1. Attitude ghetto feat Double Conscience et Métice 54</a></li>
			<li><a href="#">2. The AbiStory</a></li>
			<li><a href="#" style="color:#26C5CB;"><i class="fa fa-play" style="margin-right:4px;"></i> 3. Abitude</a></li>
			<li><a href="#">4. Mon Rap Hashdivy Et Ambdi "Nocredi"</a></li>
			<li><a href="#">5. Tel Est Mon Destin</a></li>
			<li><a href="#">6. Celle Qe J'aime Feat Jiji Et Syle</a></li>
			<li><a href="#">7. Pardonne Moi Feat Sarah</a></li>
			<li><a href="#">8. Wamaoré Feat Tsutsumbi Remix</a></li>
			<li><a href="#">9. Comment je m'appelle feat Youssa Gangsta</a></li>
			<li><a href="#">10. Pour les mecs du bitumes feat Jiiji et Ambdi "Nocredi"</a></li>
		</ul>
	</div><!-- #flip-back -->
</div><!-- #container -->

<div class="credits">
	<p>MUSIC — "<a href="http://www.jamendo.com/en/track/705190/abitude" target="_blank">Abitude</a>" by <a href="http://www.jamendo.com/en/artist/365579/abi" target="_blank">Abi</a> is licensed under <a href="http://creativecommons.org/licenses/by/3.0/" target="_blank">CC BY 3.0</a></p>
</div><!-- #credits -->
</asp:Content>
