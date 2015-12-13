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
		
		className.set ("assets/sprite/aimer.png", __ASSET__assets_sprite_aimer_png);
		type.set ("assets/sprite/aimer.png", AssetType.IMAGE);
		className.set ("assets/sprite/arena.png", __ASSET__assets_sprite_arena_png);
		type.set ("assets/sprite/arena.png", AssetType.IMAGE);
		className.set ("assets/sprite/arrow.png", __ASSET__assets_sprite_arrow_png);
		type.set ("assets/sprite/arrow.png", AssetType.IMAGE);
		className.set ("assets/sprite/arrow2.png", __ASSET__assets_sprite_arrow2_png);
		type.set ("assets/sprite/arrow2.png", AssetType.IMAGE);
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
		className.set ("assets/sprite/mph.png", __ASSET__assets_sprite_mph_png);
		type.set ("assets/sprite/mph.png", AssetType.IMAGE);
		className.set ("assets/sprite/power.png", __ASSET__assets_sprite_power_png);
		type.set ("assets/sprite/power.png", AssetType.IMAGE);
		className.set ("assets/sprite/reticle.png", __ASSET__assets_sprite_reticle_png);
		type.set ("assets/sprite/reticle.png", AssetType.IMAGE);
		className.set ("assets/sprite/reticle2.png", __ASSET__assets_sprite_reticle2_png);
		type.set ("assets/sprite/reticle2.png", AssetType.IMAGE);
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
		className.set ("assets/sprite/text-butcher.png", __ASSET__assets_sprite_text_butcher_png);
		type.set ("assets/sprite/text-butcher.png", AssetType.IMAGE);
		className.set ("assets/sprite/text-nice-hit.png", __ASSET__assets_sprite_text_nice_hit_png);
		type.set ("assets/sprite/text-nice-hit.png", AssetType.IMAGE);
		className.set ("assets/sprite/text-porridge.png", __ASSET__assets_sprite_text_porridge_png);
		type.set ("assets/sprite/text-porridge.png", AssetType.IMAGE);
		className.set ("assets/sprite/text-smashed.png", __ASSET__assets_sprite_text_smashed_png);
		type.set ("assets/sprite/text-smashed.png", AssetType.IMAGE);
		className.set ("assets/sprite/wind.png", __ASSET__assets_sprite_wind_png);
		type.set ("assets/sprite/wind.png", AssetType.IMAGE);
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
		id = "assets/sprite/wind.png";
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
		
		className.set ("assets/sprite/aimer.png", __ASSET__assets_sprite_aimer_png);
		type.set ("assets/sprite/aimer.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/arena.png", __ASSET__assets_sprite_arena_png);
		type.set ("assets/sprite/arena.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/arrow.png", __ASSET__assets_sprite_arrow_png);
		type.set ("assets/sprite/arrow.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/arrow2.png", __ASSET__assets_sprite_arrow2_png);
		type.set ("assets/sprite/arrow2.png", AssetType.IMAGE);
		
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
		
		className.set ("assets/sprite/mph.png", __ASSET__assets_sprite_mph_png);
		type.set ("assets/sprite/mph.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/power.png", __ASSET__assets_sprite_power_png);
		type.set ("assets/sprite/power.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/reticle.png", __ASSET__assets_sprite_reticle_png);
		type.set ("assets/sprite/reticle.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/reticle2.png", __ASSET__assets_sprite_reticle2_png);
		type.set ("assets/sprite/reticle2.png", AssetType.IMAGE);
		
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
		
		className.set ("assets/sprite/text-butcher.png", __ASSET__assets_sprite_text_butcher_png);
		type.set ("assets/sprite/text-butcher.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/text-nice-hit.png", __ASSET__assets_sprite_text_nice_hit_png);
		type.set ("assets/sprite/text-nice-hit.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/text-porridge.png", __ASSET__assets_sprite_text_porridge_png);
		type.set ("assets/sprite/text-porridge.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/text-smashed.png", __ASSET__assets_sprite_text_smashed_png);
		type.set ("assets/sprite/text-smashed.png", AssetType.IMAGE);
		
		className.set ("assets/sprite/wind.png", __ASSET__assets_sprite_wind_png);
		type.set ("assets/sprite/wind.png", AssetType.IMAGE);
		
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

@:keep @:bind #if display private #end class __ASSET__assets_sprite_aimer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_arena_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_arrow2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_executer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_explosion_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_font_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_front_head_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_front_left_arm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_front_left_leg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_front_right_arm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_front_right_leg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_front_torso_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_mph_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_power_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_reticle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_reticle2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_side_head_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_side_left_arm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_side_left_leg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_side_right_arm_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_side_right_leg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_side_torso_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_small_blood_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_text_butcher_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_text_nice_hit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_text_porridge_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_text_smashed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sprite_wind_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
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


@:image("assets/sprite/aimer.png") #if display private #end class __ASSET__assets_sprite_aimer_png extends lime.graphics.Image {}
@:image("assets/sprite/arena.png") #if display private #end class __ASSET__assets_sprite_arena_png extends lime.graphics.Image {}
@:image("assets/sprite/arrow.png") #if display private #end class __ASSET__assets_sprite_arrow_png extends lime.graphics.Image {}
@:image("assets/sprite/arrow2.png") #if display private #end class __ASSET__assets_sprite_arrow2_png extends lime.graphics.Image {}
@:image("assets/sprite/executer.png") #if display private #end class __ASSET__assets_sprite_executer_png extends lime.graphics.Image {}
@:image("assets/sprite/explosion.png") #if display private #end class __ASSET__assets_sprite_explosion_png extends lime.graphics.Image {}
@:image("assets/sprite/font.png") #if display private #end class __ASSET__assets_sprite_font_png extends lime.graphics.Image {}
@:image("assets/sprite/front-head.png") #if display private #end class __ASSET__assets_sprite_front_head_png extends lime.graphics.Image {}
@:image("assets/sprite/front-left-arm.png") #if display private #end class __ASSET__assets_sprite_front_left_arm_png extends lime.graphics.Image {}
@:image("assets/sprite/front-left-leg.png") #if display private #end class __ASSET__assets_sprite_front_left_leg_png extends lime.graphics.Image {}
@:image("assets/sprite/front-right-arm.png") #if display private #end class __ASSET__assets_sprite_front_right_arm_png extends lime.graphics.Image {}
@:image("assets/sprite/front-right-leg.png") #if display private #end class __ASSET__assets_sprite_front_right_leg_png extends lime.graphics.Image {}
@:image("assets/sprite/front-torso.png") #if display private #end class __ASSET__assets_sprite_front_torso_png extends lime.graphics.Image {}
@:image("assets/sprite/mph.png") #if display private #end class __ASSET__assets_sprite_mph_png extends lime.graphics.Image {}
@:image("assets/sprite/power.png") #if display private #end class __ASSET__assets_sprite_power_png extends lime.graphics.Image {}
@:image("assets/sprite/reticle.png") #if display private #end class __ASSET__assets_sprite_reticle_png extends lime.graphics.Image {}
@:image("assets/sprite/reticle2.png") #if display private #end class __ASSET__assets_sprite_reticle2_png extends lime.graphics.Image {}
@:image("assets/sprite/side-head.png") #if display private #end class __ASSET__assets_sprite_side_head_png extends lime.graphics.Image {}
@:image("assets/sprite/side-left-arm.png") #if display private #end class __ASSET__assets_sprite_side_left_arm_png extends lime.graphics.Image {}
@:image("assets/sprite/side-left-leg.png") #if display private #end class __ASSET__assets_sprite_side_left_leg_png extends lime.graphics.Image {}
@:image("assets/sprite/side-right-arm.png") #if display private #end class __ASSET__assets_sprite_side_right_arm_png extends lime.graphics.Image {}
@:image("assets/sprite/side-right-leg.png") #if display private #end class __ASSET__assets_sprite_side_right_leg_png extends lime.graphics.Image {}
@:image("assets/sprite/side-torso.png") #if display private #end class __ASSET__assets_sprite_side_torso_png extends lime.graphics.Image {}
@:image("assets/sprite/small-blood.png") #if display private #end class __ASSET__assets_sprite_small_blood_png extends lime.graphics.Image {}
@:image("assets/sprite/text-butcher.png") #if display private #end class __ASSET__assets_sprite_text_butcher_png extends lime.graphics.Image {}
@:image("assets/sprite/text-nice-hit.png") #if display private #end class __ASSET__assets_sprite_text_nice_hit_png extends lime.graphics.Image {}
@:image("assets/sprite/text-porridge.png") #if display private #end class __ASSET__assets_sprite_text_porridge_png extends lime.graphics.Image {}
@:image("assets/sprite/text-smashed.png") #if display private #end class __ASSET__assets_sprite_text_smashed_png extends lime.graphics.Image {}
@:image("assets/sprite/wind.png") #if display private #end class __ASSET__assets_sprite_wind_png extends lime.graphics.Image {}
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