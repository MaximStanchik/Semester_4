import s from "../Button/Button.module.css";

type ResetBtnPropsType = {
    title: string,
    callBack: () => void,
    disabled?: boolean,
}

const Button = (props: ResetBtnPropsType) => {
    let {title: string, callBack, disabled:boolean|undefined} = props;

    const onClickHandler = () : void => {
        callBack();
    }

    return (
        <div>
            <button className={s.button} onClick={onClickHandler} disabled={disabled}>{title}</button>
        </div>
    );
};