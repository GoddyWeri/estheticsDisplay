export class User {
    id: number | undefined;
    name: string;
    surName: string;
    email: string;
    password: string;

    constructor(id: number | undefined, name: string, surname: string, email: string, password: string){
        this.id = id;
        this.name = name;
        this.surName = surname;
        this.email = email;
        this.password = password;
    }
}

export class UserPreConfirmation {
    id: number | undefined;
    name: string;
    surname: string;
    email: string;
    password: string;
    confirmPassword: string;

    constructor(id: number| undefined, name: string, surname: string, email: string, password: string, confirmPassword:string){
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
        this.confirmPassword = confirmPassword;
    }
}