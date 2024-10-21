package com.mary_cruz.mary_cruz_app;

import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;


public class MyFirebaseMessagingService extends FirebaseMessagingService   {
    @Override
    public void onMessageReceived(RemoteMessage remoteMessage) {
        // Handle the received message
        super.onMessageReceived(remoteMessage);

    }
}