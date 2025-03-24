import {
  Column,
  CreateDateColumn,
  Entity,
  OneToMany,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';
import { Phones } from './phones.entity';

@Entity()
export class Users {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  name: string;

  @Column({ unique: true })
  email: string;

  @Column()
  password: string;

  @OneToMany(() => Phones, (phone) => phone.user, { cascade: true })
  phones: Phones[];

  @CreateDateColumn({ type: 'timestamp with time zone' })
  created: Date;

  @UpdateDateColumn({ type: 'timestamp with time zone' })
  modified: Date;

  @Column({
    type: 'timestamp with time zone',
    default: () => 'CURRENT_TIMESTAMP',
  })
  last_login: Date;

  @Column()
  token: string;

  @Column({ default: true })
  isactive: boolean;
}
