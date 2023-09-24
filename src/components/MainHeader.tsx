import Image from 'next/image';
import Link from 'next/link';
import styled from 'styled-components';
import LogoBlack from '@/assets/images/mate.png';

const Header = styled.header`
  background: #fff;
  display: flex;
  align-items: center;
  padding: 1rem;
  gap: 1rem;

  button {
    background: #000;
    color: #fff;
    padding: 0.3rem 1rem;
    border-radius: 10rem;
    cursor: pointer;
  }
`;

const Logo = styled.div`
  margin-right: auto;
`;

export const MainHeader = () => {

  return (
    <Header>
      <Logo>
        <Link href="/">
          <Image src={LogoBlack} alt="NEAR" style={{width:"32px", height: "32px" }}/>
        </Link>
      </Logo>

      <Link href="/">Home</Link>
    </Header>
  );
};
