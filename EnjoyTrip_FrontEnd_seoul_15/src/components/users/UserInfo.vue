<template>
	<div class="playlist">
		<h1>멜론 차트</h1>
		<div v-for="song in songs" :key="song.id" class="song">
			<img :src="song.albumArt" alt="Album Art" />
			<div class="song-details">
				<h2>{{ song.title }}</h2>
				<p>{{ song.artist }}</p>
			</div>
		</div>
	</div>
</template>

<script>
export default {
	data() {
		return {
			songs: [
				{ id: 1, title: "Song Title 1", artist: "Artist 1", albumArt: "album_art_1.jpg" },
				{ id: 2, title: "Song Title 2", artist: "Artist 2", albumArt: "album_art_2.jpg" },
				// Add more songs as needed
			],
		};
	},
};
</script>

<style scoped>
/* 스타일은 필요에 따라 조정하세요 */
.playlist {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

.song {
	display: flex;
	align-items: center;
	width: 300px;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 10px;
}

.song img {
	width: 50px;
	height: 50px;
	margin-right: 10px;
}

.song-details {
	flex-grow: 1;
}

.song-details h2 {
	margin: 0;
	font-size: 18px;
}

.song-details p {
	margin: 5px 0;
	font-size: 14px;
}
</style>
