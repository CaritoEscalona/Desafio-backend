export class UpdateUserDto {
  name?: string;
  email?: string;
  password?: string;
  phones?: { number: string; citycode: string; countrycode: string }[];
  isactive?: boolean;
}
