'use strict';var _regenerator=require('babel-runtime/regenerator');var _regenerator2=_interopRequireDefault(_regenerator);var _keys=require('babel-runtime/core-js/object/keys');var _keys2=_interopRequireDefault(_keys);var _asyncToGenerator2=require('babel-runtime/helpers/asyncToGenerator');var _asyncToGenerator3=_interopRequireDefault(_asyncToGenerator2);var _classCallCheck2=require('babel-runtime/helpers/classCallCheck');var _classCallCheck3=_interopRequireDefault(_classCallCheck2);var _createClass2=require('babel-runtime/helpers/createClass');var _createClass3=_interopRequireDefault(_createClass2);function _interopRequireDefault(obj){return obj&&obj.__esModule?obj:{default:obj};}var color=require('color');var fs=require('fs');var Hugo=require('alfred-hugo');var path=require('path');var svgexport=require('svgexport');var octicons=require('octicons');var octiconsPath=path.join(path.dirname(require.resolve('octicons')),'build','svg');var Icons=function(){function Icons(){(0,_classCallCheck3.default)(this,Icons);}(0,_createClass3.default)(Icons,[{key:'_pathColor',value:function _pathColor(){var iconColor=color('#FFFFFF');if(Hugo.alfredThemeFile){try{iconColor=color(Hugo.alfredTheme.result.text.color);}catch(e){}}else if(process.env.alfred_theme_background){var bgColor=color(process.env.alfred_theme_background);iconColor=bgColor.grayscale().negate();}return iconColor.rgb().string();}},{key:'rebuild',value:function(){var _ref=(0,_asyncToGenerator3.default)(_regenerator2.default.mark(function _callee(projects){var options=arguments.length>1&&arguments[1]!==undefined?arguments[1]:{};var iconPath,octiconNames,icons,iconSize,renderQueue,i,icon,renderOptions,_i,_icon;return _regenerator2.default.wrap(function _callee$(_context){while(1){switch(_context.prev=_context.next){case 0:iconPath=path.join(__dirname,'icons');octiconNames=(0,_keys2.default)(octicons);icons=[];iconSize=64;renderQueue=[];i=0;case 6:if(!(i<projects.length)){_context.next=14;break;}if(projects[i].hasOwnProperty('icon')){_context.next=9;break;}return _context.abrupt('continue',11);case 9:icon=path.parse(projects[i].icon.path);if(icon.dir===iconPath&&octiconNames.indexOf(icon.name)>=0){if(icons.indexOf(icon.name)===-1){icons.push(icon.name);}}case 11:i++;_context.next=6;break;case 14:if(options&&options.onlyMissing===true){icons=icons.filter(function(icon){try{fs.statSync(path.join(iconPath,icon+'.png'));return false;}catch(e){return true;}});}if(!(icons.length===0)){_context.next=17;break;}return _context.abrupt('return');case 17:if(Hugo.alfredThemeFile){try{iconSize=Hugo.alfredTheme.result.iconSize;}catch(e){}}renderOptions=[iconSize+':'+iconSize,'pad','path{fill:'+this._pathColor()+'}'];for(_i=0;_i<icons.length;_i++){_icon=icons[_i];if(_icon&&_icon.length>0){renderQueue.push({input:path.join(octiconsPath,_icon+'.svg'),output:[[path.join(iconPath,_icon+'.png')].concat(renderOptions)]});}}svgexport.render(renderQueue,function(err){if(err){throw err;}});case 21:case'end':return _context.stop();}}},_callee,this);}));function rebuild(_x2){return _ref.apply(this,arguments);}return rebuild;}()}]);return Icons;}();module.exports=new Icons();
//# sourceMappingURL=icons.js.map