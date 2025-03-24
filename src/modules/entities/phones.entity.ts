import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { Users } from './users.entity';

@Entity()
export class Phones {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  number: string;

  @Column()
  citycode: string;

  @Column()
  countrycode: string;

  @ManyToOne(() => Users, (user) => user.phones, { onDelete: 'CASCADE' })
  user: Users;
}
