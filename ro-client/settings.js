// Your custom settings
// See parameters in http://www.robrowser.com/getting-started#API
// var ROConfig = {
// 	development: true, // don't need to compile javascript files in chrome app since it's already a package.
// };

var ROConfig = {
	target:        document.getElementById("robrowser"),
	type:          2,
	application:   1,
	remoteClient:  "http://grf.robrowser.com/",
	development:    true,
	version:     25,
	langtype:    12,
	packetver:   20211103,
	servers: [{
		display:     "[bROK] Sakray",
		desc:        "Guardiões¨de¨Midgard",
		address:     "rathena",
		port:        6900,
		socketProxy: "ws://127.0.0.1:5999/",
		// adminList:   [2000000]
	}],
	skipServerList:  true,
	skipIntro:       false,
};