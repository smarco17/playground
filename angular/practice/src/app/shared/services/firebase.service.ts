import { Injectable } from '@angular/core';
import * as firebase from 'firebase';
import UserCredential = firebase.auth.UserCredential;

@Injectable({
  providedIn: 'root'
})
export class FirebaseService {
  EMAIL = 'skskhr@outlook.jp';
  PASSWORD = 'angularpractice';

  constructor() {
    const config = {
      apiKey: "AIzaSyC0C69Z3I2GMETRZeGinVSNqPQJHrazr_o",
      authDomain: "angularpractice-9348c.firebaseapp.com",
      databaseURL: "https://angularpractice-9348c.firebaseio.com",
      projectId: "angularpractice-9348c",
      storageBucket: "angularpractice-9348c.appspot.com",
      messagingSenderId: "612616539982",
      appId: "1:612616539982:web:f8f5dde363644b8104581f",
      measurementId: "G-V849V1VRVM"
    };
    firebase.initializeApp(config);
    this.signInOrCreateUser(this.EMAIL, this.PASSWORD);
  }

  signInOrCreateUser(email, password): void{
    firebase.auth().signInWithEmailAndPassword(email, password).then((userCredential: UserCredential) => {
      firebase.auth().currentUser.getIdToken().then((token: string) => {
        console.log(token);
      });
      // console.log(userCredential.user.uid);
    }).catch(() => {
      firebase.auth().createUserWithEmailAndPassword(email, password).then((userCredential: UserCredential) => {
        firebase.auth().currentUser.getIdToken().then((token: string) => {
          console.log(token);
        });
        // console.log(userCredential.user.uid);
      });
    });
  }
}
