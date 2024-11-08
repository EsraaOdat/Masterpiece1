"use strict";(self.__LOADABLE_LOADED_CHUNKS__=self.__LOADABLE_LOADED_CHUNKS__||[]).push([[33731],{286988:(e,t,n)=>{n.d(t,{Z:()=>a,v:()=>r});let r=()=>"undefined"!=typeof navigator&&"getInstalledRelatedApps"in navigator;async function a(){if(!r())return[];try{return await navigator.getInstalledRelatedApps()}catch(e){return[]}}},344064:(e,t,n)=>{n.d(t,{o$:()=>r,ty:()=>a,vE:()=>i});let{Provider:r,MaybeConsumer:a,useMaybeHook:i}=(0,n(342513).Z)("inviteContext")},191313:(e,t,n)=>{n.d(t,{L_:()=>a,Nh:()=>i,qn:()=>r});let r=(e,t=null)=>{try{return"undefined"!=typeof window&&window.localStorage.getItem(e)||t}catch(e){return console.error("Cannot access localStorage."),t}},a=e=>{try{if("undefined"==typeof window)return;window.localStorage.removeItem(e)}catch(e){console.error("Cannot access localStorage.")}},i=(e,t)=>{try{if("undefined"==typeof window)return;window.localStorage.setItem(e,t)}catch(e){console.error("Cannot access localStorage.")}}},870526:(e,t,n)=>{n.d(t,{Z:()=>w});var r=n(667294),a=n(883119),i=n(490166),l=n(785893);let o=40,p=70,s={__style:{borderRadius:"4px",padding:"10px 14px"}},d={__style:{borderWidth:"1px",borderStyle:"solid",borderColor:"white"}},u={__style:{borderRadius:"4px",padding:"10px 14px 9px 8px",whiteSpace:"nowrap"}},c=e=>({__style:{borderRadius:"24px",paddingTop:"10px",paddingBottom:"10px",paddingLeft:"14px",paddingRight:"14px",...e}}),m=e=>"transparent"===e||"dark"===e?"inverse":"primary"===e?"light":"default",_=({color:e,icon:t})=>t?u:"transparent"===e?{__style:{...s.__style,...d.__style}}:s,w=({accessibilityLabel:e,color:t,customStyles:n,forwardedRef:s,icon:d,inline:u=!1,minHeight:w=o,minWidth:f=p,onTouch:h,pressState:y,shape:v,text:g})=>{let[x,k]=(0,r.useState)(!1),b=m(t),S=_({color:t,icon:d}),Z=(0,l.jsx)(a.xu,{onMouseEnter:()=>k(!0),onMouseLeave:()=>k(!1),position:"relative",children:(0,l.jsx)(a.xu,{color:"primary"===t&&x?"errorBase":t,dangerouslySetInlineStyle:"pill"===v?c(n):S,display:u?"inlineBlock":"flex",justifyContent:"center",minHeight:w,minWidth:f,children:(0,l.jsxs)(a.kC,{alignItems:"center",justifyContent:"center",children:[d&&(0,l.jsx)(a.xu,{paddingX:"check"===d?2:0,children:(0,l.jsx)(a.JO,{accessibilityLabel:e,color:b,icon:d,inline:!0,size:"check"===d?16:20})}),(0,l.jsx)(a.xv,{color:b,inline:!0,lineClamp:1,size:"300",weight:"bold",children:g})]})})});return h?(0,l.jsx)(i.Z,{onTouch:h,pressState:y||"none",rounding:"pill"===v?"pill":2,children:(0,l.jsx)(a.xu,{ref:s,children:Z})}):Z}},233731:(e,t,n)=>{n.d(t,{MZ:()=>I,di:()=>N,Ai:()=>U});var r=n(667294),a=n(616550),i=n(883119),l=n(127285),o=n(286988),p=n(587703),s=n(422210),d=n(741983),u=n(805783),c=n(5859),m=n(191313),_=n(233440),w=n(573810),f=n(217058),h=n(149722),y=n(757293),v=n(773616),g=n(870526),x=n(460270),k=n(979606),b=n(931090),S=n(862249),Z=n(171966);let j=({children:e,external:t,externalQueryParams:n,target:r,href:i,features:l})=>{let o=(0,a.k6)();if(!i)return null;let p=(0,x.Z)(i);return e({navigate:e=>{e.preventDefault(),(0,S.Z)({url:p})||t?"undefined"!=typeof window&&window.Windows?(0,Z.Z)(p):(0,b.Z)(p,{queryParams:n,features:l}):(0,k.Z)({event:e,href:i,history:o,target:"blank"===r?"blank":null})}})};var P=n(785893),A=n(86264),C=n(669177),L=n(386008);let R=(0,r.lazy)(()=>Promise.all([n.e(97270),n.e(35239)]).then(n.bind(n,547010))),D=e=>"string"==typeof e?e:`${e.pathname||""}${e.search?`?${e.search}`:""}`,T=(e,t=!1)=>function({isAppUpsellDisabled:n,...g}){let{children:x,clientTrackingParams:k,deeplinkUri:b,external:S,onTouch:Z,refresh:j,to:T,viewParameter:I,viewType:U}=g,N=(0,v.Z)(),[B,$]=(0,r.useState)(!1),[O,W]=(0,r.useState)(!1),[E,q]=(0,r.useState)(!1),{isAuth:M}=(0,h.Z)(),{userAgent:{platform:F},locale:H}=(0,c.B)(),z=(0,L.Tt)(),G=(0,p.Z)(),V=(0,a.TH)();(0,r.useEffect)(()=>{(async function(){(0,o.v)()&&(q(!0),(await (0,o.Z)()).length>0&&W(!0))})()},[]),(0,r.useEffect)(()=>{M||"true"===(0,_.Nl)().getItem(l.Vg)||((0,f.My)(`unauth.app_upsell.has_app.${O.toString()}`),(0,_.Nl)().setItem(l.Vg,"true"))},[O,M]);let X=()=>{G({event_type:1701,view_type:U,view_parameter:I}),B&&$(!1)};return(0,P.jsxs)(i.xu,{"data-test-id":"deeplink-wrapper",children:[B&&(0,P.jsx)(r.Suspense,{children:(0,P.jsx)(R,{app_upsell_type:"deep-link-app-upsell-modal",clientTrackingParams:k,deepLinkUri:b,isOpen:!0,onDismiss:()=>{G({component:14157,element:10308,event_type:10220,view_type:U||202,view_parameter:I,aux_data:{app_upsell_type:"deep-link-app-upsell-modal"}})},onOpenInApp:()=>{(0,m.Nh)("deeplinkBehavior","branchfallback"),X()},shouldTrackDismiss:!0,to:T,viewParameter:I,viewType:U})}),(0,P.jsx)(A.Z,{children:r=>(0,P.jsx)(e,{...g,onTouch:e=>{let a=N&&!n&&M&&!S&&!j&&!(0,u.FP)(window)&&!("ios"===F&&(H||"").startsWith("ar"))&&(0,C.kp)((0,s.Z)(z?.created_at));if(a){let t=!0,n=!1;"string"==typeof b&&(b||"").startsWith("/pin/")&&((0,d.uM)(V)||(0,d.am)(V)||(0,d.C$)(V))?E&&O&&b&&"android"===F&&(t=!1):(t=!1,n=!0),t?(e.stopPropagation(),e.preventDefault(),$(!0)):n||(e.stopPropagation(),e.preventDefault(),G({component:14347,element:13582,event_type:3830,view_type:20,view_parameter:3844,aux_data:{upsell_reason:"deep-link-app-upsell-modal"}}),r(b??(0,y.Z)(V,"android"===F),"deep-link-app-upsell-modal"))}else"branchfallback"!==(0,m.qn)("deeplinkBehavior")||(0,w.qn)("fallbackAttempt")||(e.stopPropagation(),e.preventDefault(),(0,w.Nh)("fallbackAttempt",1),r(b,"deep-link-app-upsell-modal",`${window.location.origin}${D(T)}`),X());!(t&&a)&&Z&&Z(e)},children:x})})]})},I=T(({accessibilityLabel:e,children:t,external:n,externalQueryParams:r,features:a,inline:l=!1,newTab:o,nofollow:p,onTouch:s,onBlur:d,onFocus:u,pressState:c,rounding:m,to:_})=>(0,P.jsx)(j,{external:n,externalQueryParams:r,features:a,href:_,target:o?"blank":null,children:({navigate:n})=>(0,P.jsx)(i.rU,{accessibilityLabel:e,display:l?"inlineBlock":"block",href:(0,x.Z)(_),onBlur:d?({event:e})=>d(e):void 0,onClick:({event:e,dangerouslyDisableOnNavigation:t})=>{t(),s?.(e),e.defaultPrevented||n(e)},onFocus:u?({event:e})=>u(e):void 0,rel:p?"nofollow":"none",rounding:m,tapStyle:(Array.isArray(c)?c:[c]).includes("compress")?"compress":"none",underline:"none",children:t})})),U=T(({external:e,externalQueryParams:t,newTab:n,onTouch:r,to:a,...i})=>(0,P.jsx)(j,{external:e,externalQueryParams:t,href:a,target:n?"blank":null,children:({navigate:e})=>(0,P.jsx)(g.Z,{onTouch:t=>{r?.(t),t.defaultPrevented||e(t)},...i})})),N=T(g.Z,!0)},86264:(e,t,n)=>{n.d(t,{Z:()=>k});var r=n(214877),a=n(340523),i=n(5859),l=n(344064),o=n(669177),p=n(286988),s=n(624797),d=n(953565);let u="http://play.google.com/store/apps/details?id=com.pinterest",c=["access_token","new_password","new_password_confirm","password","next"],m=(e,t)=>t?(0,s.ru)(e,{invite_code:t}):e,_=(e,t,n)=>{if("ios"===t&&"string"==typeof e&&e.startsWith("discover/article/")){let t=e.split("/")[2];e=`discover_article/${t}/?is_deeplink=1`}return("string"==typeof e&&"shopping/"===e&&(e="?is_deeplink=1"),"string"==typeof e)?m(e,n):"ios"===t||"ipad"===t?m(e.iOS,n):"android"===t?m(e.android,n):null},w=({deeplinkUri:e,invite_code:t,platform:n,fallbackUrl:r,unauthId:a,app_upsell_type:i})=>({deeplink_path:_(e,n,t),current_page_url:(0,s.Gw)("undefined"!=typeof window?window.location.href:"",c),install_id:a,utm_source:140,utm_medium:2152,app_upsell_type:i,...r?{af_r:r}:null}),f=({deeplinkUri:e,invite_code:t,platform:n,unauthId:r,app_upsell_type:a})=>{let i=JSON.stringify({deeplink_path:_(e,n,t),current_page_url:(0,s.Gw)("undefined"!=typeof window?window.location.href:"",c),install_id:r});return{referrer:(0,s.XP)({utm_source:"mweb",utm_medium:"upsell",utm_content:i,app_upsell_type:a})}},h=({unauthId:e,app_upsell_type:t})=>({referrer:encodeURI((0,s.XP)({utm_source:"mweb",utm_medium:"upsell",utm_campaign:"twa",utm_content:e,app_upsell_type:t}))}),y=({isAuthenticated:e,deeplinkUri:t,fallbackUrl:n,invite_code:r,logContextEvent:a,platform:i,redirectToLite:l,unauthId:o,userAgent:c,app_upsell_type:m})=>{if(a?.({component:14347,element:13582,event_type:701,view_type:20,view_parameter:3844,aux_data:{app_upsell_type:m}}),t){let _=w({isAuthenticated:e,deeplinkUri:t,fallbackUrl:n,invite_code:r,platform:i,unauthId:o,userAgent:c,app_upsell_type:m});if((0,d.nP)("mweb.deeplink",{sampleRate:1,tags:{platform:i}}),r&&(0,d.nP)("mweb.deeplink.invite_code",{sampleRate:1}),(0,d.nP)("mweb.deeplink.unauthId",{sampleRate:1,tags:{withUnauthId:!!o}}),l){(0,d.nP)("mweb.deeplink.lite_link",{sampleRate:1}),a?.({component:14347,element:13582,event_type:14540,view_type:20,view_parameter:3844,aux_data:{app_upsell_type:m}});let e=h({unauthId:o,app_upsell_type:m});window.location.href=(0,s.ru)("http://play.google.com/store/apps/details?id=com.pinterest.twa",e)}else if("android"===i){let e=f({deeplinkUri:t,invite_code:r,platform:i,unauthId:o,app_upsell_type:m});(0,p.v)()?(0,p.Z)().then(n=>{if(n.length>0){let e=window.location.href.endsWith("/login")?window.location.href.replace("/login","string"==typeof t?t:t.android):window.location.href,n=(0,s.ru)(e,_);a?.({component:14347,element:13582,event_type:703,view_type:20,view_parameter:3844,aux_data:{app_upsell_type:m}}),window.open(n)||a?.({component:14347,element:13582,event_type:702,view_type:20,view_parameter:3844,aux_data:{app_upsell_type:m}})}else a?.({component:14347,element:13582,event_type:14538,view_type:20,view_parameter:3844,aux_data:{app_upsell_type:m}}),window.location.href=(0,s.ru)(u,e)}).catch(()=>{(0,d.nP)("mweb_android.deeplink.playStore.error",{sampleRate:1})}):(a?.({component:14347,element:13582,event_type:14538,view_type:20,view_parameter:3844,aux_data:{app_upsell_type:m}}),window.location.href=(0,s.ru)(u,e))}else{if((0,d.nP)("mweb.deeplink.appsflyer_link",{sampleRate:1}),"ios"===i&&"undefined"!=typeof window&&window.location.href.includes("show_yip_modal")){window.location.href=(0,s.ru)("https://pinterest.com/pinterest-predicts",_);return}a?.({component:14347,element:13582,event_type:14539,view_type:20,view_parameter:3844,aux_data:{app_upsell_type:m}}),window.location.href=(0,s.ru)("https://pinterest.onelink.me/TVSr/21e04bfd",_)}}};var v=n(785893);function g({children:e,invite_code:t}){let{isAuthenticated:n,isBot:l,unauthId:p,userAgent:{platform:s,raw:d}}=(0,i.B)(),{logContextEvent:u}=(0,r.v)(),{checkExperiment:c}=(0,a.F)();return e(async(e,r,a)=>{u({component:14347,element:13582,event_type:700,view_type:20,view_parameter:3844,aux_data:{app_upsell_type:r}}),y({isAuthenticated:n,checkExperiment:c,deeplinkUri:e,fallbackUrl:a,invite_code:t,logContextEvent:u,platform:s,redirectToLite:(0,o.Rp)({isBot:l,platform:s,userAgent:d}),unauthId:p,userAgent:d,app_upsell_type:r})})}let x=e=>(0,v.jsx)(l.ty,{children:t=>(0,v.jsx)(g,{...e,invite_code:t})});x.displayName="DeepLinkNavigator";let k=x},757293:(e,t,n)=>{n.d(t,{Z:()=>a});var r=n(741983);function a(e,t){return"/"===e.pathname?"/":(0,r.am)(e)&&t?`board/${e.pathname.substr(1)}`:e.pathname.substr(1)}},773616:(e,t,n)=>{n.d(t,{Z:()=>a});var r=n(545007);let a=()=>(0,r.v9)(({session:{canUseNativeApp:e}})=>e)},669177:(e,t,n)=>{n.d(t,{G3:()=>d,Rp:()=>s,kp:()=>o});var r=n(188349),a=n(191313),i=n(573810);let l=14*r.F4,o=(e,t)=>{let n=function(){let e=Date.now(),t=Number((0,a.qn)("appUpsell"));return{currentTime:e,firstUpsellTime:Number((0,a.qn)("firstUpsellTime")),lastUpsellTime:t,showedAppUpsellCurrentSession:!!(0,i.qn)("showedAppUpsellCurrentSession")}}();return e?function(e,t,n){let{currentTime:r,firstUpsellTime:i,lastUpsellTime:o,showedAppUpsellCurrentSession:p}=e;return(n=n||l,!i||r<i+t)?!p:r-o>n&&((0,a.L_)("firstUpsellTime"),!0)}(n,r.F4):function(e,t){let{currentTime:n,lastUpsellTime:r}=e;return t=t||l,!r||n-r>t}(n,t)},p=e=>{let t=(e=e.toLowerCase()).match(/android\s([0-9\.]*)/i);return t?t[1]:void 0},s=({isBot:e,platform:t,userAgent:n})=>{try{return!e&&"android"===t&&7>parseFloat(p(n))}catch(e){return!1}},d=e=>(e.startsWith("zh")||e.startsWith("ar")?e:e.slice(0,2)).toUpperCase()}}]);
//# sourceMappingURL=https://sm.pinimg.com/webapp/33731-25b0897363fc351a.mjs.map