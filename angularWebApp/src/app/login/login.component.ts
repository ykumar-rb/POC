import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }
  textbox1=""
  textbox2=""
  clickHandler(){
    console.log("Login request submitted")
    alert("Login successfull");
  }

}
