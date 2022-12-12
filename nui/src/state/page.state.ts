import {
  atom,
  useRecoilState,
  useRecoilValue,
  useSetRecoilState,
} from "recoil";

export enum nineadminMenuPage {
  Main,
  Players,
  IFrame,
}

const pageState = atom<nineadminMenuPage>({
  default: 0,
  key: "menuPage",
});

export const usePage = () => useRecoilState(pageState);

export const useSetPage = () => useSetRecoilState(pageState);

export const usePageValue = () => useRecoilValue(pageState);
