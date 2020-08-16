import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { RegisterComponent } from './register/register.component';
import { LoginComponent } from './login/login.component';
import { AboutUsComponent } from './about-us/about-us.component';

import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { GalleryComponent } from './gallery/gallery.component';

@NgModule({
  declarations: [
    AppComponent,
    RegisterComponent,
    LoginComponent,
    AboutUsComponent,
    GalleryComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    RouterModule.forRoot([
    {path: 'register', component: RegisterComponent},
    {path: 'login', component: LoginComponent},
    {path: 'aboutUs', component: AboutUsComponent}
    ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
