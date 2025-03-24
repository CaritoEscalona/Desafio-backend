import {
  IsEmail,
  IsNotEmpty,
  IsString,
  ValidateNested,
  ArrayNotEmpty,
} from 'class-validator';
import { Type } from 'class-transformer';

class PhoneDto {
  @IsNotEmpty()
  @IsString()
  number: string;

  @IsNotEmpty()
  @IsString()
  citycode: string;

  @IsNotEmpty()
  @IsString()
  countrycode: string;
}

export class CreateUserDto {
  @IsNotEmpty()
  @IsString()
  name: string;

  @IsNotEmpty()
  @IsEmail()
  email: string;

  @IsNotEmpty()
  @IsString()
  password: string;

  @ArrayNotEmpty()
  @ValidateNested({ each: true })
  @Type(() => PhoneDto)
  phones: PhoneDto[];
}
