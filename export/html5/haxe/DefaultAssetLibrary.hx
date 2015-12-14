package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_arial_ttf);
		
		#end
		
		#if flash
		
		className.set ("assets/music/music-intro-end.ogg", __ASSET__assets_music_music_intro_end_ogg);
		type.set ("assets/music/music-intro-end.ogg", AssetType.SOUND);
		className.set ("assets/music/music.ogg", __ASSET__assets_music_music_ogg);
		type.set ("assets/music/music.ogg", AssetType.SOUND);
		className.set ("assets/sound/arrow-air.ogg", __ASSET__assets_sound_arrow_air_ogg);
		type.set ("assets/sound/arrow-air.ogg", AssetType.SOUND);
		className.set ("assets/sound/bow-bend.ogg", __ASSET__assets_sound_bow_bend_ogg);
		type.set ("assets/sound/bow-bend.ogg", AssetType.SOUND);
		className.set ("assets/sound/bow-release.ogg", __ASSET__assets_sound_bow_release_ogg);
		type.set ("assets/sound/bow-release.ogg", AssetType.SOUND);
		className.set ("assets/sound/click.ogg", __ASSET__assets_sound_click_ogg);
		type.set ("assets/sound/click.ogg", AssetType.SOUND);
		className.set ("assets/sound/explode.ogg", __ASSET__assets_sound_explode_ogg);
		type.set ("assets/sound/explode.ogg", AssetType.SOUND);
		className.set ("assets/sound/footsteps.ogg", __ASSET__assets_sound_footsteps_ogg);
		type.set ("assets/sound/footsteps.ogg", AssetType.SOUND);
		className.set ("assets/sound/glasses.ogg", __ASSET__assets_sound_glasses_ogg);
		type.set ("assets/sound/glasses.ogg", AssetType.SOUND);
		className.set ("assets/sound/hit.ogg", __ASSET__assets_sound_hit_ogg);
		type.set ("assets/sound/hit.ogg", AssetType.SOUND);
		className.set ("assets/sound/king.ogg", __ASSET__assets_sound_king_ogg);
		type.set ("assets/sound/king.ogg", AssetType.SOUND);
		className.set ("assets/sound/lady.ogg", __ASSET__assets_sound_lady_ogg);
		type.set ("assets/sound/lady.ogg", AssetType.SOUND);
		className.set ("assets/sound/laugh.ogg", __ASSET__assets_sound_laugh_ogg);
		type.set ("assets/sound/laugh.ogg", AssetType.SOUND);
		className.set ("assets/sound/score.ogg", __ASSET__assets_sound_score_ogg);
		type.set ("assets/sound/score.ogg", AssetType.SOUND);
		className.set ("assets/sound/scream-girl.ogg", __ASSET__assets_sound_scream_girl_ogg);
		type.set ("assets/sound/scream-girl.ogg", AssetType.SOUND);
		className.set ("assets/sound/scream-guy.ogg", __ASSET__assets_sound_scream_guy_ogg);
		type.set ("assets/sound/scream-guy.ogg", AssetType.SOUND);
		className.set ("assets/sound/screams.ogg", __ASSET__assets_sound_screams_ogg);
		type.set ("assets/sound/screams.ogg", AssetType.SOUND);
		className.set ("assets/sound/tavern.ogg", __ASSET__assets_sound_tavern_ogg);
		type.set ("assets/sound/tavern.ogg", AssetType.SOUND);
		className.set ("assets/sound/whiper.ogg", __ASSET__assets_sound_whiper_ogg);
		type.set ("assets/sound/whiper.ogg", AssetType.SOUND);
		className.set ("assets/sprite/aimer.png", __ASSET__assets_sprite_aimer_png);
		type.set ("assets/sprite/aimer.png", AssetType.IMAGE);
		className.set ("assets/sprite/arena.png", __ASSET__assets_sprite_arena_png);
		type.set ("assets/sprite/arena.png", AssetType.IMAGE);
		className.set ("assets/sprite/arrow.png", __ASSET__assets_sprite_arrow_png);
		type.set ("assets/sprite/arrow.png", AssetType.IMAGE);
		className.set ("assets/sprite/arrow2.png", __ASSET__assets_sprite_arrow2_png);
		type.set ("assets/sprite/arrow2.png", AssetType.IMAGE);
		className.set ("assets/sprite/black.png", __ASSET__assets_sprite_black_png);
		type.set ("assets/sprite/black.png", AssetType.IMAGE);
		className.set ("assets/sprite/end-evil.png", __ASSET__assets_sprite_end_evil_png);
		type.set ("assets/sprite/end-evil.png", AssetType.IMAGE);
		className.set ("assets/sprite/end-good.png", __ASSET__assets_sprite_end_good_png);
		type.set ("assets/sprite/end-good.png", AssetType.IMAGE);
		className.set ("assets/sprite/executer.png", __ASSET__assets_sprite_executer_png);
		type.set ("assets/sprite/executer.png", AssetType.IMAGE);
		className.set ("assets/sprite/explosion.png", __ASSET__assets_sprite_explosion_png);
		type.set ("assets/sprite/explosion.png", AssetType.IMAGE);
		className.set ("assets/sprite/font.png", __ASSET__assets_sprite_font_png);
		type.set ("assets/sprite/font.png", AssetType.IMAGE);
		className.set ("assets/sprite/front-head.png", __ASSET__assets_sprite_front_head_png);
		type.set ("assets/sprite/front-head.png", AssetType.IMAGE);
		className.set ("assets/sprite/front-left-arm.png", __ASSET__assets_sprite_front_left_arm_png);
		type.set ("assets/sprite/front-left-arm.png", AssetType.IMAGE);
		className.set ("assets/sprite/front-left-leg.png", __ASSET__assets_sprite_front_left_leg_png);
		type.set ("assets/sprite/front-left-leg.png", AssetType.IMAGE);
		className.set ("assets/sprite/front-right-arm.png", __ASSET__assets_sprite_front_right_arm_png);
		type.set ("assets/sprite/front-right-arm.png", AssetType.IMAGE);
		className.set ("assets/sprite/front-right-leg.png", __ASSET__assets_sprite_front_right_leg_png);
		type.set ("assets/sprite/front-right-leg.png", AssetType.IMAGE);
		className.set ("assets/sprite/front-torso.png", __ASSET__assets_sprite_front_torso_png);
		type.set ("assets/sprite/front-torso.png", AssetType.IMAGE);
		className.set ("assets/sprite/frontking.png", __ASSET__assets_sprite_frontking_png);
		type.set ("assets/sprite/frontking.png", AssetType.IMAGE);
		className.set ("assets/sprite/how-to-play.png", __ASSET__assets_sprite_how_to_play_png);
		type.set ("assets/sprite/how-to-play.png", AssetType.IMAGE);
		className.set ("assets/sprite/intro.png", __ASSET__assets_sprite_intro_png);
		type.set ("assets/sprite/intro.png", AssetType.IMAGE);
		className.set ("assets/sprite/king.png", __ASSET__assets_sprite_king_png);
		type.set ("assets/sprite/king.png", AssetType.IMAGE);
		className.set ("assets/sprite/lady.png", __ASSET__assets_sprite_lady_png);
		type.set ("assets/sprite/lady.png", AssetType.IMAGE);
		className.set ("assets/sprite/mission1.png", __ASSET__assets_sprite_mission1_png);
		type.set ("assets/sprite/mission1.png", AssetType.IMAGE);
		className.set ("assets/sprite/mission1text.png", __ASSET__assets_sprite_mission1text_png);
		type.set ("assets/sprite/mission1text.png", AssetType.IMAGE);
		className.set ("assets/sprite/mission2.png", __ASSET__assets_sprite_mission2_png);
		type.set ("assets/sprite/mission2.png", AssetType.IMAGE);
		className.set ("assets/sprite/mission2text.png", __ASSET__assets_sprite_mission2text_png);
		type.set ("assets/sprite/mission2text.png", AssetType.IMAGE);
		className.set ("assets/sprite/mission3.png", __ASSET__assets_sprite_mission3_png);
		type.set ("assets/sprite/mission3.png", AssetType.IMAGE);
		className.set ("assets/sprite/mission3text.png", __ASSET__assets_sprite_mission3text_png);
		type.set ("assets/sprite/mission3text.png", AssetType.IMAGE);
		className.set ("assets/sprite/mission4.png", __ASSET__assets_sprite_mission4_png);
		type.set ("assets/sprite/mission4.png", AssetType.IMAGE);
		className.set ("assets/sprite/mission4text.png", __ASSET__assets_sprite_mission4text_png);
		type.set ("assets/sprite/mission4text.png", AssetType.IMAGE);
		className.set ("assets/sprite/mission5.png", __ASSET__assets_sprite_mission5_png);
		type.set ("assets/sprite/mission5.png", AssetType.IMAGE);
		className.set ("assets/sprite/mission5text.png", __ASSET__assets_sprite_mission5text_png);
		type.set ("assets/sprite/mission5text.png", AssetType.IMAGE);
		className.set ("assets/sprite/mph.png", __ASSET__assets_sprite_mph_png);
		type.set ("assets/sprite/mph.png", AssetType.IMAGE);
		className.set ("assets/sprite/power.png", __ASSET__assets_sprite_power_png);
		type.set ("assets/sprite/power.png", AssetType.IMAGE);
		className.set ("assets/sprite/reticle.png", __ASSET__assets_sprite_reticle_png);
		type.set ("assets/sprite/reticle.png", AssetType.IMAGE);
		className.set ("assets/sprite/reticle2.png", __ASSET__assets_sprite_reticle2_png);
		type.set ("assets/sprite/reticle2.png", AssetType.IMAGE);
		className.set ("assets/sprite/scoreboard.png", __ASSET__assets_sprite_scoreboard_png);
		type.set ("assets/sprite/scoreboard.png", AssetType.IMAGE);
		className.set ("assets/sprite/side-head.png", __ASSET__assets_sprite_side_head_png);
		type.set ("assets/sprite/side-head.png", AssetType.IMAGE);
		className.set ("assets/sprite/side-left-arm.png", __ASSET__assets_sprite_side_left_arm_png);
		type.set ("assets/sprite/side-left-arm.png", AssetType.IMAGE);
		className.set ("assets/sprite/side-left-leg.png", __ASSET__assets_sprite_side_left_leg_png);
		type.set ("assets/sprite/side-left-leg.png", AssetType.IMAGE);
		className.set ("assets/sprite/side-right-arm.png", __ASSET__assets_sprite_side_right_arm_png);
		type.set ("assets/sprite/side-right-arm.png", AssetType.IMAGE);
		className.set ("assets/sprite/side-right-leg.png", __ASSET__assets_sprite_side_right_leg_png);
		type.set ("assets/sprite/side-right-leg.png", AssetType.IMAGE);
		className.set ("assets/sprite/side-torso.png", __ASSET__assets_sprite_side_torso_png);
		type.set ("assets/sprite/side-torso.png", AssetType.IMAGE);
		className.set ("assets/sprite/small-blood.png", __ASSET__assets_sprite_small_blood_png);
		type.set ("assets/sprite/small-blood.png", AssetType.IMAGE);
		className.set ("assets/sprite/story-mode.png", __ASSET__assets_sprite_story_mode_png);
		type.set ("assets/sprite/story-mode.png", AssetType.IMAGE);
		className.set ("assets/sprite/tavern.png", __ASSET__assets_sprite_tavern_png);
		type.set ("assets/sprite/tavern.png", AssetType.IMAGE);
		className.set ("assets/sprite/text-aaah.png", __ASSET__assets_sprite_text_aaah_png);
		type.set ("assets/sprite/text-aaah.png", AssetType.IMAGE);
		className.set ("assets/sprite/text-butcher.png", __ASSET__assets_sprite_text_butcher_png);
		type.set ("assets/sprite/text-butcher.png", AssetType.IMAGE);
		className.set ("assets/sprite/text-nice-hit.png", __ASSET__assets_sprite_text_nice_hit_png);
		type.set ("assets/sprite/text-nice-hit.png", AssetType.IMAGE);
		className.set ("assets/sprite/text-porridge.png", __ASSET__assets_sprite_text_porridge_png);
		type.set ("assets/sprite/text-porridge.png", AssetType.IMAGE);
		className.set ("assets/sprite/text-smashed.png", __ASSET__assets_sprite_text_smashed_png);
		type.set ("assets/sprite/text-smashed.png", AssetType.IMAGE);
		className.set ("assets/sprite/text-spare.png", __ASSET__assets_sprite_text_spare_png);
		type.set ("assets/sprite/text-spare.png", AssetType.IMAGE);
		className.set ("assets/sprite/title.png", __ASSET__assets_sprite_title_png);
		type.set ("assets/sprite/title.png", AssetType.IMAGE);
		className.set ("assets/sprite/tuto1.png", __ASSET__assets_sprite_tuto1_png);
		type.set ("assets/sprite/tuto1.png", AssetType.IMAGE);
		className.set ("assets/sprite/tuto2.png", __ASSET__assets_sprite_tuto2_png);
		type.set ("assets/sprite/tuto2.png", AssetType.IMAGE);
		className.set ("assets/sprite/wind.png", __ASSET__assets_sprite_wind_png);
		type.set ("assets/sprite/wind.png", AssetType.IMAGE);
		className.set ("assets/sprite/x.png", __ASSET__assets_sprite_x_png);
		type.set ("assets/sprite/x.png", AssetType.IMAGE);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/beep.ogg", __ASSET__assets_sounds_beep_ogg);
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		className.set ("assets/sounds/flixel.ogg", __ASSET__assets_sounds_flixel_ogg);
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		#elseif html5
		
		var id;
		id = "assets/music/music-intro-end.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/music.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/arrow-air.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/bow-bend.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/bow-release.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/click.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/explode.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/footsteps.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/glasses.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/hit.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/king.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/lady.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/laugh.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/score.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/scream-girl.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/scream-guy.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/screams.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/tavern.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sound/whiper.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sprite/aimer.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/arena.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/arrow2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/black.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/end-evil.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/end-good.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/executer.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/explosion.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/font.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/front-head.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/front-left-arm.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/front-left-leg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/front-right-arm.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/front-right-leg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/front-torso.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/frontking.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/how-to-play.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/intro.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/king.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/lady.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/mission1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/mission1text.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/mission2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/mission2text.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/mission3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/mission3text.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/mission4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/mission4text.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/mission5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/mission5text.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/mph.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/power.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/reticle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/reticle2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/scoreboard.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/side-head.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/side-left-arm.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/side-left-leg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/side-right-arm.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/side-right-leg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/side-torso.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/small-blood.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/story-mode.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/tavern.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/text-aaah.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/text-butcher.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/text-nice-hit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/text-porridge.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/text-smashed.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/text-spare.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/title.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/tuto1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/tuto2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/wind.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sprite/x.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__assets_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/arial.ttf";
		className.set (id, __ASSET__assets_fonts_arial_ttf);
		
		type.set (id, AssetType.FONT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/music/music-intro-end.ogg", __ASSET__assets_music_music_intro_end_ogg);
		type.set ("assets/music/music-intro-end.ogg", AssetType.SOUND);
		
		className.set ("assets/music/music.ogg", __ASSET__assets_music_music_ogg);
		type.set ("assets/music/music.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/arrow-air.ogg", __ASSET__assets_sound_arrow_air_ogg);
		type.set ("assets/sound/arrow-air.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/bow-bend.ogg", __ASSET__assets_sound_bow_bend_ogg);
		type.set ("assets/sound/bow-bend.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/bow-release.ogg", __ASSET__assets_sound_bow_release_ogg);
		type.set ("assets/sound/bow-release.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/click.ogg", __ASSET__assets_sound_click_ogg);
		type.set ("assets/sound/click.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/explode.ogg", __ASSET__assets_sound_explode_ogg);
		type.set ("assets/sound/explode.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/footsteps.ogg", __ASSET__assets_sound_footsteps_ogg);
		type.set ("assets/sound/footsteps.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/glasses.ogg", __ASSET__assets_sound_glasses_ogg);
		type.set ("assets/sound/glasses.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/hit.ogg", __ASSET__assets_sound_hit_ogg);
		type.set ("assets/sound/hit.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/king.ogg", __ASSET__assets_sound_king_ogg);
		type.set ("assets/sound/king.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/lady.ogg", __ASSET__assets_sound_lady_ogg);
		type.set ("assets/sound/lady.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/laugh.ogg", __ASSET__assets_sound_laugh_ogg);
		type.set ("assets/sound/laugh.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/score.ogg", __ASSET__assets_sound_score_ogg);
		type.set ("assets/sound/score.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/scream-girl.ogg", __ASSET__assets_sound_scream_girl_ogg);
		type.set ("assets/sound/scream-girl.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/scream-guy.ogg", __ASSET__assets_sound_scream_guy_ogg);
		type.set ("assets/sound/scream-guy.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/screams.ogg", __ASSET__assets_sound_screams_ogg);
		type.set ("assets/sound/screams.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/tavern.ogg", __ASSET__assets_sound_tavern_ogg);
		type.set ("assets/sound/tavern.ogg", AssetType.SOUND);
		
		className.set ("assets/sound/whiper.ogg", __ASSET__assets_sound_whiper_ogg);
		type.set ("assets/sound/whiper.ogg", AssetType.SOUND);
		
		className.set ("assets/sprite/aimer.png", __ASSET__assets_sprite_aimer_png);
		type.set ("assets/sprite/aimer.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/arena.png", __ASSET__assets_sprite_arena_png);
		type.set ("assets/sprite/arena.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/arrow.png", __ASSET__assets_sprite_arrow_png);
		type.set ("assets/sprite/arrow.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/arrow2.png", __ASSET__assets_sprite_arrow2_png);
		type.set ("assets/sprite/arrow2.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/black.png", __ASSET__assets_sprite_black_png);
		type.set ("assets/sprite/black.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/end-evil.png", __ASSET__assets_sprite_end_evil_png);
		type.set ("assets/sprite/end-evil.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/end-good.png", __ASSET__assets_sprite_end_good_png);
		type.set ("assets/sprite/end-good.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/executer.png", __ASSET__assets_sprite_executer_png);
		type.set ("assets/sprite/executer.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/explosion.png", __ASSET__assets_sprite_explosion_png);
		type.set ("assets/sprite/explosion.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/font.png", __ASSET__assets_sprite_font_png);
		type.set ("assets/sprite/font.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/front-head.png", __ASSET__assets_sprite_front_head_png);
		type.set ("assets/sprite/front-head.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/front-left-arm.png", __ASSET__assets_sprite_front_left_arm_png);
		type.set ("assets/sprite/front-left-arm.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/front-left-leg.png", __ASSET__assets_sprite_front_left_leg_png);
		type.set ("assets/sprite/front-left-leg.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/front-right-arm.png", __ASSET__assets_sprite_front_right_arm_png);
		type.set ("assets/sprite/front-right-arm.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/front-right-leg.png", __ASSET__assets_sprite_front_right_leg_png);
		type.set ("assets/sprite/front-right-leg.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/front-torso.png", __ASSET__assets_sprite_front_torso_png);
		type.set ("assets/sprite/front-torso.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/frontking.png", __ASSET__assets_sprite_frontking_png);
		type.set ("assets/sprite/frontking.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/how-to-play.png", __ASSET__assets_sprite_how_to_play_png);
		type.set ("assets/sprite/how-to-play.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/intro.png", __ASSET__assets_sprite_intro_png);
		type.set ("assets/sprite/intro.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/king.png", __ASSET__assets_sprite_king_png);
		type.set ("assets/sprite/king.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/lady.png", __ASSET__assets_sprite_lady_png);
		type.set ("assets/sprite/lady.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/mission1.png", __ASSET__assets_sprite_mission1_png);
		type.set ("assets/sprite/mission1.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/mission1text.png", __ASSET__assets_sprite_mission1text_png);
		type.set ("assets/sprite/mission1text.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/mission2.png", __ASSET__assets_sprite_mission2_png);
		type.set ("assets/sprite/mission2.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/mission2text.png", __ASSET__assets_sprite_mission2text_png);
		type.set ("assets/sprite/mission2text.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/mission3.png", __ASSET__assets_sprite_mission3_png);
		type.set ("assets/sprite/mission3.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/mission3text.png", __ASSET__assets_sprite_mission3text_png);
		type.set ("assets/sprite/mission3text.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/mission4.png", __ASSET__assets_sprite_mission4_png);
		type.set ("assets/sprite/mission4.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/mission4text.png", __ASSET__assets_sprite_mission4text_png);
		type.set ("assets/sprite/mission4text.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/mission5.png", __ASSET__assets_sprite_mission5_png);
		type.set ("assets/sprite/mission5.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/mission5text.png", __ASSET__assets_sprite_mission5text_png);
		type.set ("assets/sprite/mission5text.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/mph.png", __ASSET__assets_sprite_mph_png);
		type.set ("assets/sprite/mph.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/power.png", __ASSET__assets_sprite_power_png);
		type.set ("assets/sprite/power.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/reticle.png", __ASSET__assets_sprite_reticle_png);
		type.set ("assets/sprite/reticle.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/reticle2.png", __ASSET__assets_sprite_reticle2_png);
		type.set ("assets/sprite/reticle2.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/scoreboard.png", __ASSET__assets_sprite_scoreboard_png);
		type.set ("assets/sprite/scoreboard.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/side-head.png", __ASSET__assets_sprite_side_head_png);
		type.set ("assets/sprite/side-head.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/side-left-arm.png", __ASSET__assets_sprite_side_left_arm_png);
		type.set ("assets/sprite/side-left-arm.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/side-left-leg.png", __ASSET__assets_sprite_side_left_leg_png);
		type.set ("assets/sprite/side-left-leg.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/side-right-arm.png", __ASSET__assets_sprite_side_right_arm_png);
		type.set ("assets/sprite/side-right-arm.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/side-right-leg.png", __ASSET__assets_sprite_side_right_leg_png);
		type.set ("assets/sprite/side-right-leg.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/side-torso.png", __ASSET__assets_sprite_side_torso_png);
		type.set ("assets/sprite/side-torso.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/small-blood.png", __ASSET__assets_sprite_small_blood_png);
		type.set ("assets/sprite/small-blood.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/story-mode.png", __ASSET__assets_sprite_story_mode_png);
		type.set ("assets/sprite/story-mode.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/tavern.png", __ASSET__assets_sprite_tavern_png);
		type.set ("assets/sprite/tavern.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/text-aaah.png", __ASSET__assets_sprite_text_aaah_png);
		type.set ("assets/sprite/text-aaah.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/text-butcher.png", __ASSET__assets_sprite_text_butcher_png);
		type.set ("assets/sprite/text-butcher.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/text-nice-hit.png", __ASSET__assets_sprite_text_nice_hit_png);
		type.set ("assets/sprite/text-nice-hit.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/text-porridge.png", __ASSET__assets_sprite_text_porridge_png);
		type.set ("assets/sprite/text-porridge.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/text-smashed.png", __ASSET__assets_sprite_text_smashed_png);
		type.set ("assets/sprite/text-smashed.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/text-spare.png", __ASSET__assets_sprite_text_spare_png);
		type.set ("assets/sprite/text-spare.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/title.png", __ASSET__assets_sprite_title_png);
		type.set ("assets/sprite/title.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/tuto1.png", __ASSET__assets_sprite_tuto1_png);
		type.set ("assets/sprite/tuto1.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/tuto2.png", __ASSET__assets_sprite_tuto2_png);
		type.set ("assets/sprite/tuto2.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/wind.png", __ASSET__assets_sprite_wind_png);
		type.set ("assets/sprite/wind.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/x.png", __ASSET__assets_sprite_x_png);
		type.set ("assets/sprite/x.png", AssetType.IMAGE);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/beep.ogg", __ASSET__assets_sounds_beep_ogg);
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/flixel.ogg", __ASSET__assets_sounds_flixel_ogg);
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofString (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_music_music_intro_end_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_arrow_air_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_bow_bend_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_bow_release_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_click_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_explode_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_footsteps_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_glasses_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_hit_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_king_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_lady_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_laugh_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_score_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_scream_girl_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_scream_guy_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_screams_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_tavern_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_whiper_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_aimer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_arena_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_arrow2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_black_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_end_evil_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_end_good_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_executer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_explosion_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_font_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_front_head_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_front_left_arm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_front_left_leg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_front_right_arm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_front_right_leg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_front_torso_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_frontking_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_how_to_play_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_intro_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_king_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_lady_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_mission1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_mission1text_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_mission2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_mission2text_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_mission3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_mission3text_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_mission4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_mission4text_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_mission5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_mission5text_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_mph_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_power_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_reticle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_reticle2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_scoreboard_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_side_head_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_side_left_arm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_side_left_leg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_side_right_arm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_side_right_leg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_side_torso_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_small_blood_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_story_mode_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_tavern_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_text_aaah_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_text_butcher_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_text_nice_hit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_text_porridge_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_text_smashed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_text_spare_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_tuto1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_tuto2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_wind_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends null { }


#elseif html5
















































































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 


#else



#if (windows || mac || linux || cpp)


@:file("assets/music/music-intro-end.ogg") #if display private #end class __ASSET__assets_music_music_intro_end_ogg extends lime.utils.Bytes {}
@:file("assets/music/music.ogg") #if display private #end class __ASSET__assets_music_music_ogg extends lime.utils.Bytes {}
@:file("assets/sound/arrow-air.ogg") #if display private #end class __ASSET__assets_sound_arrow_air_ogg extends lime.utils.Bytes {}
@:file("assets/sound/bow-bend.ogg") #if display private #end class __ASSET__assets_sound_bow_bend_ogg extends lime.utils.Bytes {}
@:file("assets/sound/bow-release.ogg") #if display private #end class __ASSET__assets_sound_bow_release_ogg extends lime.utils.Bytes {}
@:file("assets/sound/click.ogg") #if display private #end class __ASSET__assets_sound_click_ogg extends lime.utils.Bytes {}
@:file("assets/sound/explode.ogg") #if display private #end class __ASSET__assets_sound_explode_ogg extends lime.utils.Bytes {}
@:file("assets/sound/footsteps.ogg") #if display private #end class __ASSET__assets_sound_footsteps_ogg extends lime.utils.Bytes {}
@:file("assets/sound/glasses.ogg") #if display private #end class __ASSET__assets_sound_glasses_ogg extends lime.utils.Bytes {}
@:file("assets/sound/hit.ogg") #if display private #end class __ASSET__assets_sound_hit_ogg extends lime.utils.Bytes {}
@:file("assets/sound/king.ogg") #if display private #end class __ASSET__assets_sound_king_ogg extends lime.utils.Bytes {}
@:file("assets/sound/lady.ogg") #if display private #end class __ASSET__assets_sound_lady_ogg extends lime.utils.Bytes {}
@:file("assets/sound/laugh.ogg") #if display private #end class __ASSET__assets_sound_laugh_ogg extends lime.utils.Bytes {}
@:file("assets/sound/score.ogg") #if display private #end class __ASSET__assets_sound_score_ogg extends lime.utils.Bytes {}
@:file("assets/sound/scream-girl.ogg") #if display private #end class __ASSET__assets_sound_scream_girl_ogg extends lime.utils.Bytes {}
@:file("assets/sound/scream-guy.ogg") #if display private #end class __ASSET__assets_sound_scream_guy_ogg extends lime.utils.Bytes {}
@:file("assets/sound/screams.ogg") #if display private #end class __ASSET__assets_sound_screams_ogg extends lime.utils.Bytes {}
@:file("assets/sound/tavern.ogg") #if display private #end class __ASSET__assets_sound_tavern_ogg extends lime.utils.Bytes {}
@:file("assets/sound/whiper.ogg") #if display private #end class __ASSET__assets_sound_whiper_ogg extends lime.utils.Bytes {}
@:image("assets/sprite/aimer.png") #if display private #end class __ASSET__assets_sprite_aimer_png extends lime.graphics.Image {}
@:image("assets/sprite/arena.png") #if display private #end class __ASSET__assets_sprite_arena_png extends lime.graphics.Image {}
@:image("assets/sprite/arrow.png") #if display private #end class __ASSET__assets_sprite_arrow_png extends lime.graphics.Image {}
@:image("assets/sprite/arrow2.png") #if display private #end class __ASSET__assets_sprite_arrow2_png extends lime.graphics.Image {}
@:image("assets/sprite/black.png") #if display private #end class __ASSET__assets_sprite_black_png extends lime.graphics.Image {}
@:image("assets/sprite/end-evil.png") #if display private #end class __ASSET__assets_sprite_end_evil_png extends lime.graphics.Image {}
@:image("assets/sprite/end-good.png") #if display private #end class __ASSET__assets_sprite_end_good_png extends lime.graphics.Image {}
@:image("assets/sprite/executer.png") #if display private #end class __ASSET__assets_sprite_executer_png extends lime.graphics.Image {}
@:image("assets/sprite/explosion.png") #if display private #end class __ASSET__assets_sprite_explosion_png extends lime.graphics.Image {}
@:image("assets/sprite/font.png") #if display private #end class __ASSET__assets_sprite_font_png extends lime.graphics.Image {}
@:image("assets/sprite/front-head.png") #if display private #end class __ASSET__assets_sprite_front_head_png extends lime.graphics.Image {}
@:image("assets/sprite/front-left-arm.png") #if display private #end class __ASSET__assets_sprite_front_left_arm_png extends lime.graphics.Image {}
@:image("assets/sprite/front-left-leg.png") #if display private #end class __ASSET__assets_sprite_front_left_leg_png extends lime.graphics.Image {}
@:image("assets/sprite/front-right-arm.png") #if display private #end class __ASSET__assets_sprite_front_right_arm_png extends lime.graphics.Image {}
@:image("assets/sprite/front-right-leg.png") #if display private #end class __ASSET__assets_sprite_front_right_leg_png extends lime.graphics.Image {}
@:image("assets/sprite/front-torso.png") #if display private #end class __ASSET__assets_sprite_front_torso_png extends lime.graphics.Image {}
@:image("assets/sprite/frontking.png") #if display private #end class __ASSET__assets_sprite_frontking_png extends lime.graphics.Image {}
@:image("assets/sprite/how-to-play.png") #if display private #end class __ASSET__assets_sprite_how_to_play_png extends lime.graphics.Image {}
@:image("assets/sprite/intro.png") #if display private #end class __ASSET__assets_sprite_intro_png extends lime.graphics.Image {}
@:image("assets/sprite/king.png") #if display private #end class __ASSET__assets_sprite_king_png extends lime.graphics.Image {}
@:image("assets/sprite/lady.png") #if display private #end class __ASSET__assets_sprite_lady_png extends lime.graphics.Image {}
@:image("assets/sprite/mission1.png") #if display private #end class __ASSET__assets_sprite_mission1_png extends lime.graphics.Image {}
@:image("assets/sprite/mission1text.png") #if display private #end class __ASSET__assets_sprite_mission1text_png extends lime.graphics.Image {}
@:image("assets/sprite/mission2.png") #if display private #end class __ASSET__assets_sprite_mission2_png extends lime.graphics.Image {}
@:image("assets/sprite/mission2text.png") #if display private #end class __ASSET__assets_sprite_mission2text_png extends lime.graphics.Image {}
@:image("assets/sprite/mission3.png") #if display private #end class __ASSET__assets_sprite_mission3_png extends lime.graphics.Image {}
@:image("assets/sprite/mission3text.png") #if display private #end class __ASSET__assets_sprite_mission3text_png extends lime.graphics.Image {}
@:image("assets/sprite/mission4.png") #if display private #end class __ASSET__assets_sprite_mission4_png extends lime.graphics.Image {}
@:image("assets/sprite/mission4text.png") #if display private #end class __ASSET__assets_sprite_mission4text_png extends lime.graphics.Image {}
@:image("assets/sprite/mission5.png") #if display private #end class __ASSET__assets_sprite_mission5_png extends lime.graphics.Image {}
@:image("assets/sprite/mission5text.png") #if display private #end class __ASSET__assets_sprite_mission5text_png extends lime.graphics.Image {}
@:image("assets/sprite/mph.png") #if display private #end class __ASSET__assets_sprite_mph_png extends lime.graphics.Image {}
@:image("assets/sprite/power.png") #if display private #end class __ASSET__assets_sprite_power_png extends lime.graphics.Image {}
@:image("assets/sprite/reticle.png") #if display private #end class __ASSET__assets_sprite_reticle_png extends lime.graphics.Image {}
@:image("assets/sprite/reticle2.png") #if display private #end class __ASSET__assets_sprite_reticle2_png extends lime.graphics.Image {}
@:image("assets/sprite/scoreboard.png") #if display private #end class __ASSET__assets_sprite_scoreboard_png extends lime.graphics.Image {}
@:image("assets/sprite/side-head.png") #if display private #end class __ASSET__assets_sprite_side_head_png extends lime.graphics.Image {}
@:image("assets/sprite/side-left-arm.png") #if display private #end class __ASSET__assets_sprite_side_left_arm_png extends lime.graphics.Image {}
@:image("assets/sprite/side-left-leg.png") #if display private #end class __ASSET__assets_sprite_side_left_leg_png extends lime.graphics.Image {}
@:image("assets/sprite/side-right-arm.png") #if display private #end class __ASSET__assets_sprite_side_right_arm_png extends lime.graphics.Image {}
@:image("assets/sprite/side-right-leg.png") #if display private #end class __ASSET__assets_sprite_side_right_leg_png extends lime.graphics.Image {}
@:image("assets/sprite/side-torso.png") #if display private #end class __ASSET__assets_sprite_side_torso_png extends lime.graphics.Image {}
@:image("assets/sprite/small-blood.png") #if display private #end class __ASSET__assets_sprite_small_blood_png extends lime.graphics.Image {}
@:image("assets/sprite/story-mode.png") #if display private #end class __ASSET__assets_sprite_story_mode_png extends lime.graphics.Image {}
@:image("assets/sprite/tavern.png") #if display private #end class __ASSET__assets_sprite_tavern_png extends lime.graphics.Image {}
@:image("assets/sprite/text-aaah.png") #if display private #end class __ASSET__assets_sprite_text_aaah_png extends lime.graphics.Image {}
@:image("assets/sprite/text-butcher.png") #if display private #end class __ASSET__assets_sprite_text_butcher_png extends lime.graphics.Image {}
@:image("assets/sprite/text-nice-hit.png") #if display private #end class __ASSET__assets_sprite_text_nice_hit_png extends lime.graphics.Image {}
@:image("assets/sprite/text-porridge.png") #if display private #end class __ASSET__assets_sprite_text_porridge_png extends lime.graphics.Image {}
@:image("assets/sprite/text-smashed.png") #if display private #end class __ASSET__assets_sprite_text_smashed_png extends lime.graphics.Image {}
@:image("assets/sprite/text-spare.png") #if display private #end class __ASSET__assets_sprite_text_spare_png extends lime.graphics.Image {}
@:image("assets/sprite/title.png") #if display private #end class __ASSET__assets_sprite_title_png extends lime.graphics.Image {}
@:image("assets/sprite/tuto1.png") #if display private #end class __ASSET__assets_sprite_tuto1_png extends lime.graphics.Image {}
@:image("assets/sprite/tuto2.png") #if display private #end class __ASSET__assets_sprite_tuto2_png extends lime.graphics.Image {}
@:image("assets/sprite/wind.png") #if display private #end class __ASSET__assets_sprite_wind_png extends lime.graphics.Image {}
@:image("assets/sprite/x.png") #if display private #end class __ASSET__assets_sprite_x_png extends lime.graphics.Image {}
@:file("/usr/local/lib/haxe/lib/flixel/3,3,11/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.Bytes {}
@:file("/usr/local/lib/haxe/lib/flixel/3,3,11/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.Bytes {}
@:file("/usr/local/lib/haxe/lib/flixel/3,3,11/assets/sounds/beep.ogg") #if display private #end class __ASSET__assets_sounds_beep_ogg extends lime.utils.Bytes {}
@:file("/usr/local/lib/haxe/lib/flixel/3,3,11/assets/sounds/flixel.ogg") #if display private #end class __ASSET__assets_sounds_flixel_ogg extends lime.utils.Bytes {}
@:font("/usr/local/lib/haxe/lib/flixel/3,3,11/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("/usr/local/lib/haxe/lib/flixel/3,3,11/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_arial_ttf (); src = font.src; name = font.name; super (); }}

#end

#end