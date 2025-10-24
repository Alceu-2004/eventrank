import type { ReactNode } from "react";

interface CenteredLayoutProps {
  children: ReactNode;
}

const CenteredLayout = ({ children }: CenteredLayoutProps) => {
  return (
    <div className="flex justify-center w-full min-h-screen pt-[80px] pb-6">
      <div className="w-full max-w-6xl px-4">{children}</div>
    </div>
  );
};

export default CenteredLayout;