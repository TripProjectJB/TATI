<script setup></script>

<template>
	<aside id="sidebar">
		<div class="inner">
			<!-- Search -->
			<section id="search" class="alt">
				<form method="post" action="#">
					<input type="text" name="query" id="query" placeholder="Search" />
				</form>
			</section>

			<!-- userinfo -->
			<section>
				<header class="major">
					<h2>My Information</h2>
				</header>
				<div class="row 50% uniform">
					<div class="8u">
						<span class="image fit"><img src="@/images/pic01.jpg" alt="" /></span>
					</div>
					<div class="4u$">
						<ul class="actions" style="padding-top: 5px">
							<li>
								<button @click="$router.push({ name: 'mypage' })">MyPage</button>
							</li>
						</ul>
						<ul class="actions">
							<li>
								<a href="#" class="button">Logout&nbsp;</a>
							</li>
						</ul>
					</div>
				</div>
				<ul class="contact">
					<li></li>
					<li class="fa-home">김종범 (kbumk123)</li>
					<li class="fa-home"></li>
				</ul>
				<button @click="$router.push({ name: 'follower' })">Follower : userId.Follower</button>
				<button @click="$router.push({ name: 'following' })">Following : userId.Following</button>
			</section>

			<!-- Menu -->
			<nav id="menu">
				<header class="major">
					<h2>Menu</h2>
				</header>
				<ul>
					<li><RouterLink :to="{ name: 'main' }">Homepage</RouterLink></li>
					<li><RouterLink :to="{ name: 'map' }">Tourist Attractions</RouterLink></li>
					<li>
						<span class="opener">Board</span>
						<ul>
							<li><RouterLink :to="{ name: 'list' }">Type A</RouterLink></li>
							<li><RouterLink :to="{ name: 'userinfo' }">Type B</RouterLink></li>
							<li><RouterLink :to="{ name: 'list' }">Type C</RouterLink></li>
							<li><RouterLink :to="{ name: 'list' }">Type D</RouterLink></li>
						</ul>
					</li>
					<li><RouterLink :to="{ name: 'elements' }">ELEMENTS</RouterLink></li>
					<li><a href="#">Etiam Dolore</a></li>
					<li><a href="#">Adipiscing</a></li>
					<li>
						<span class="opener">Another Submenu</span>
						<ul>
							<li><a href="#">Lorem Dolor</a></li>
							<li><a href="#">Ipsum Adipiscing</a></li>
							<li><a href="#">Tempus Magna</a></li>
							<li><a href="#">Feugiat Veroeros</a></li>
						</ul>
					</li>
				</ul>
			</nav>

			<!-- Section -->
			<section>
				<header class="major">
					<h2>Ante interdum</h2>
				</header>
				<div class="mini-posts">
					<article>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
					</article>
					<article>
						<a href="#" class="image"><img src="../../images/pic08.jpg" alt="" /></a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
					</article>
					<article>
						<a href="#" class="image"><img src="../../images/pic09.jpg" alt="" /></a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
					</article>
				</div>
				<ul class="actions">
					<li><a href="#" class="button">More</a></li>
				</ul>
			</section>

			<!-- Section -->
			<section>
				<header class="major">
					<h2>Get in touch</h2>
				</header>
				<p>
					Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim
					lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem
					feugiat tempus aliquam.
				</p>
				<ul class="contact">
					<li class="fa-envelope-o">
						<a href="#">information@untitled.tld</a>
					</li>
					<li class="fa-phone">(000) 000-0000</li>
					<li class="fa-home">
						1234 Somewhere Road #8254<br />
						Nashville, TN 00000-0000
					</li>
				</ul>
			</section>

			<!-- Footer -->
			<footer id="footer">
				<p class="copyright">
					&copy; Untitled. All rights reserved. Demo Images:
					<a href="https://unsplash.com">Unsplash</a>. Design:
					<a href="https://html5up.net">HTML5 UP</a>.
				</p>
			</footer>
		</div>
	</aside>
</template>

<style scoped></style>
