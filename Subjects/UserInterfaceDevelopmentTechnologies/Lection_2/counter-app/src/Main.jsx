const searchMovies = (str, type): void => {
    setLoading(true);

    if(str === '') str = 'matrix'

    fetch('') //тут должен быть адрес а пототм ключ
    .then(respons: Response => respons.json())
    .then (data => {
        setMovies(data.Search);
        setLoading(false)
    })
    .catch((err): void => {
        console.error(err);
        setLoading(false)
    })

}