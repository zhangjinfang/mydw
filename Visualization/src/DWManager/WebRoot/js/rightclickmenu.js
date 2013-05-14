// Custom alert function
window.alert = function(msg) {
	info("alert: " + msg);
};

function refreshNode() {
	if (tree.getSelected() && tree.getSelected().reload) {
	    tree.getSelected().reload();
	}
}


var oncontextmenu = function(e)
{
	// Make sure popup only displays on codeman_js_tree
	if(checkEventIn(e, $('codeman_js_tree')) == false) {
		return;
	}

    if(!e) {
        e = window.event;
    }

    if(browserInfo.IsGecko) {
        try {
            e.preventDefault();
        } catch(ex) {
        }
    }

    $('popup').style.left = e.clientX + 'px';
    $('popup').style.top = e.clientY  + 'px';
    $('popup').style.display = "";
    fixPos($('popup'), e.clientX, e.clientY);

    return false;
};

OnDocumentClick = function( event )
{
	if(checkEventIn(event, $('popup')) == true) {
		return;
	}

    $('popup').style.display = "none";
}

function fixPos(menu, x, y)
{
	var docheight,docwidth,dh,dw;
	docheight = document.body.clientHeight;
	docwidth  = document.body.clientWidth;

	dh = y - docheight;
	dw = x - docwidth;
	debug( menu.style.width );

	if(dw>0)
	{
		menu.style.left = (x - dw - menu.style.width) + document.body.scrollLeft + "px";
	}
	else
	{
		menu.style.left = x + document.body.scrollLeft;
	}
	if(dh>0)
	{
		menu.style.top = (y - dh) + document.body.scrollTop + "px"
	}
	else
	{
		menu.style.top  = y + document.body.scrollTop;
	}
}

try {
   $('codeman_js_tree').oncontextmenu = oncontextmenu;
   document.onclick = OnDocumentClick;
} catch(ex) {
}

if(browserInfo.IsGecko) {
    try {
       $('codeman_js_tree').addEventListener(
	   	'contextmenu', oncontextmenu, true);
    } catch(ex) {
    }

    document.addEventListener('click',OnDocumentClick,true);
}

/**
 Hide the popup menu.
 */
function hidePopup() {
	$('popup').style.display = "none";
}

function test() {
	if (tree.getSelected()) {
		var node = tree.getSelected();
		debug("node.icon=" + node.icon);
		debug("node.openIcon=" + node.openIcon);
		debug("node.folder=" + node.folder);
		debug("node.open=" + node.open);
		
		node.icon = '/images/nodeicons/83.gif';
		node.openIcon = '/images/nodeicons/83.gif';
		
		if(node.updateIcon) {
			node.updateIcon();
		}
		
	}
}