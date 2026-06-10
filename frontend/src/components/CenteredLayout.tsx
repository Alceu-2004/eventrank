import type { ReactNode } from "react";

interface CenteredLayoutProps {
  children: ReactNode;
}

const CenteredLayout = ({ children }: CenteredLayoutProps) => (
  <div className="page-wrapper">
    <div className="container">{children}</div>
  </div>
);

export default CenteredLayout;
