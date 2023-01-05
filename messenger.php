<?php

/*

Kontackt Messenger.

email: movileanuion@gmail.com 
fb: fb.com/vaneayoung

Copyright 2019 by Vanea Young

--------------------------------
2020 - Modified for WoWonder

*/
 

require_once('assets/init.php');
 
	
	if (!$wo['loggedin']) {
		 
		header("location: /welcome?returnto=".urlencode($_SERVER['REQUEST_URI']));
		
	}
	


try {
  
	// build engine
	$core = new VY_CORE;
 
    $messenger = $core->im_messenger();
	
	// get param
	$cmd = isset($_GET['cmd']) ? $core->test_input($_GET['cmd']) : ( isset($_POST['cmd']) ? $core->test_input($_POST['cmd']) : '');
	$view_as_json = isset($_GET['view_as']) ? $core->test_input($_GET['view_as']) : ( isset($_POST['view_as']) ? $core->test_input($_POST['view_as']) : '');
	$userid = isset($_GET['userid']) ? $core->test_input($_GET['userid']) : ( isset($_POST['userid']) ? $core->test_input($_POST['userid']) : '');	
	$text = isset($_POST['text']) ? $_POST['text'] : '';
	$page = isset($_POST['pagecount']) ? $core->test_input($_POST['pagecount']) : '';
	$id = isset($_POST['id']) ? $core->test_input($_POST['id']) : '';
	$recipient = $userid;
	
	
 
	
	
	switch ($cmd){
	
	
	case 'open':
	
	$messenger->openBox();
	
	break;
 
	
	case 'getConversation': 
	$messenger->getConversation($userid);
	break;
 
 
	case 'get-attachments':
	
	$messenger->getAttachments($userid);
	
	break;
	case 'get-more-attachments':
	$messenger->moreAttachments($userid);
	break;
	
	case 'getChatCurColor':
	echo $messenger->getChatCurrentColor($userid);
	break;
	
	case 'setColor':
	echo $messenger->setColor($userid);
	break;
	
	case 'uToBlackList':
	$messenger->toBlacklist($userid);
	break;
	
	case 'hideConversation':
	$messenger->hideConversation($userid);
	break;
	
	case 'delConversation':
	$messenger->delConversation($userid);
	break;
	
	case 'searchFriends':
	$messenger->PMsearchForFriends();
	break;
	
	case 'sendMessage':

	if(strlen($text) <= 0 || !$recipient){
		
		 $messenger->sendResponse(['response' => $messenger->lang['pm_error_send'] . ' ~1']);
	
	} else {
 
	
	if($messenger->sendMessage($text,$recipient))
	$messenger->sendResponse(['response' => '1']);
	else if(empty($text))
	$messenger->sendResponse(['response' => $messenger->lang['pm_empty_text']]);
	else if(!$recipient)
	$messenger->sendResponse(['response' => $messenger->lang['pm_error_send'] . ' ~1']);
	else
	$messenger->sendResponse(['response' => $messenger->lang['pm_error_send'] . ' ~2']);
	}
 
	
	
	break;
	
	case 'previous-messages':
	$messenger->getPrevMessages($userid,$page);
	break;
	
	case 'node-get-last-msg':
	$messenger->nodeLastMessage($userid);
	break;
	
	case 'node-update-as-read':
	$messenger->updateMessageAsSeen($id,$userid);
	break;
	case 'node-update-all-msgs-as-read':
	$messenger->updateAllMessagesAsRead($userid);
	break;
	case 'get-page-details': 
	echo json_encode($messenger->getPageDetails(0,1,1));
	break;
	case 'get-page-name': 
	$messenger->getPageDetails();
	break;
	case 'spam':
	
	$messenger->reportMessage($id);
	break;
	
	case 'delete':
	$messenger->deleteMessage($id);
	break;
	
	case 'get-nicknames':
	$messenger->getNicknames($userid);
	break;
	
	case 'setnickname':
	$messenger->setNickname($userid);
	break;
	
	case 'search-in-conversation':
	$messenger->search_in_conversation($userid);
	break;
	
	case 'onlineTab':
	$messenger->onlineTab();
	break;
	
	case 'getMyGroups':
	$messenger->getMyGroups();
	break;
	
	case 'clear-messages-tick':
	$messenger->clearMessagesTick();
	break;
	
	case 'uploadscreen':
	$messenger->uploadscreen();
	break;
	
	case 'send-voice-clip':
	$messenger->sendVoiceClip();
	break;
	
	case 'moreConversations':
	$messenger->getMoreContacts($page);
	break;
	
	case 'call':
	$messenger->callingPopups($userid);
	break;
	
	case 'getShortcutsSessionUserInfo':
	$messenger->getShortcutsSessionUserInfo();
	break;
	
	case 'live-messages':
	$messenger->liveMessages();
	break;
 
	case 'upload-media':
	$messenger->uploadMedia();
	break;
	
	case 'atch':
	$messenger->getAttachment();
	break;
	
	case 'deletemedia':
	$messenger->deleteMedia();
	break;
	
	case 'get-gifs':
	$messenger->getGifs();
	break;
	
	case 'getlang':
	$messenger->getLang();
	break;
	
	case 'online':
	$messenger->online();
	break;
	
	case 'get-stickers':
	$messenger->getStickers();
	break;
	
	case 'open-sticker-pack':
	$messenger->openStickerPack();
	break;
	
	case 'search-stickers':
	$messenger->searchStickers();
	break;
	
	case 'openuser':
	$core->openUser();
	break;
	case 'openpage':
	$core->openPage();
	break;
	case 'add-user-to-chat':
	$messenger->addUserToChat();
	break;
	
	case 'ice-server-credentials':
	$messenger->getIceServerCredentials();
	break;
	
	case 'check_privacy':
	
	$messenger->check_privacy();
	break;
	
	case 'fetchurl':
	$messenger->fetchurl();
	break;
	
	case 'update-peer-id':
	$messenger->updatePeerId();
	break;
	
	case 'set-peer-status':
	$messenger->setPeerStatus();
	break;
	
	case 'emit':
 
	
	$core->emit_notification_to_socketio($_POST['wdata']);
	
	break;
	
	case 'call-popup':
	$messenger->CallPopup();
	break;
	case 'answer-popup':
	$messenger->AnswerPopup();
	break;
	case 'initiate-call':
	$messenger->initiateCall(0);
	break;
	
	case 'call-error':
	$messenger->callErrorMsg();
	break;
	
	case 'mute-byuser':
	$messenger->getNotificationByUser();
	break;
	case 'mute-contact':
	$messenger->MuteContact();
	break;
	case 'ajax_getMyMutedContacts':
	$messenger->ajax_getMyMutedContacts();
	break;
	case 'bbcode':
	$string = isset($_POST['string']) ? $core->test_input($_POST['string']) : '';
	$min = isset($_POST['min']) && $_POST['min'] == 'yes' ? 1 : 0;
	if(empty($string)) {
		
		echo $string;
		
	} else {
		
		echo $messenger->str_messenger($string,$min);
		
	}
	

	break;
	
	case 'global-popup':
	 $messenger->get_global_popup();
	break;
	
	case 'get-group-members':
	$messenger->get_group_members();
	break;
	case 'get-group-members-count':
	$messenger->get_group_members_count(1);
	break;
	case 'get-my-contacts':
	$messenger->get_my_contacts();
	break;
	case 'group-add-new-admin':
	echo $messenger->group_add_new_admin();
	break;
	case 'group-remove-admin':
	echo $messenger->group_remove_admin();
	break;
	case 'group_chat_stats':
	echo $messenger->group_chat_stats();
	break;
	case 'group-clear':
	echo $messenger->clear_group();
	break;
	
	case 'delete-group':
	echo $messenger->delete_group();
	break;
	
	case 'get-group-details':
	$messenger->ajax_getGroupDetails();
	break;
	
	case 'check-group-admin':
	echo $messenger->ajax_check_group_admin();
	break;
	
	case 'group-exit-check-owner':
	echo $messenger->ajax_check_group_admin_owner();
	break;
	
	case 'get-user-details':
	$id = isset($_POST['id']) ? $core->test_input($_POST['id']) : (isset($_GET['id']) ? $core->test_input($_GET['id']) : '');
	echo json_encode($messenger->getUserDetails($id));
	break; 
	case 'get-allmy-contacts':
	$messenger->getAllMyContacts();
	break;
	
	case 'search-in-all-contacts':
	$messenger->searchInAllMyContacts();
	break;
	
	case'cron':
	$messenger->m_cron();
	break;
	
	default:
 
    ob_start();
    $messenger->constructPage($userid);
    $page_content = ob_get_contents();
    ob_end_clean();
	
	$wo['description'] = $wo['config']['siteDesc'];
	$wo['keywords']    = $wo['config']['siteKeywords'];
	$wo['page']        = $core->lang['Messenger'];
	$wo['title']       = $core->lang['Messenger'];
	$wo['content']     = $page_content; 
	echo Wo_Loadpage('container');
	
 
	break;
	
	
	}

	
	} catch (Exception $e) {
	print $e->getMessage();
}
