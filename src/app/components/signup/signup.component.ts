// signup.component.ts

import { Component } from '@angular/core';
import { User, UserPreConfirmation } from 'src/app/model/user';
import { UserService } from 'src/app/service/user.service';
import { FormsModule, ReactiveFormsModule  } from '@angular/forms';  


@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css'],
})
export class SignupComponent {
  user: UserPreConfirmation = {
    id: undefined , name: '', surname: '', email: '', password: '', confirmPassword: '',
   
  };
  userToStore: User = {
   id: undefined , name: '', surName: '', email: '', password: ''  
  };

  constructor(private userService: UserService) {}

  onSubmit() {
    if (this.user.password !== this.user.confirmPassword) {
      alert("Pass error");
      return;
    }

    this.userToStore = new User(this.user.id, this.user.name, this.user.surname, this.user.email, this.user.password);
    // Call your userService to send the user data
    this.userService.addUser(this.userToStore).subscribe(
      (response) => {
        console.log('Signup successful', response);
      },
      (error) => {
        console.error('Signup error', error);
      }
    );
  }
}

