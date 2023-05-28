export default {
    state: {
        validationError: null,
        status: false
    },
    //принимаем данные
    actions: {
        //вывод категорий
        async UPLOAD_AVATAR({commit}, avatar) {
            try {
                const formData  = new FormData();
                formData.append('photo_file', avatar)
                //запрос на сервер
                const res = await fetch('http://store/public/api/user/avatar', {
                    method: 'post',
                    headers: {
                        'Authorization': 'Bearer ' + localStorage.getItem('token'),
                    },
                    body: formData,
                })

                //принимаем данные с сервера
                const upload = await res.json()

                if (upload.data.status)
                    commit('SET_STATUS_UPLOAD', upload.data.status)

                //записываем данные в хранилище
                if (upload.error)
                    commit('SET_VALIDATION_ERROR_UPLOAD', upload.error.errors)
            }

            //если запрос не сработал выводим ошиибки в консоль
            catch (err) {
                console.log(err);
            }
        },
    },

    //изменяем данные
    mutations: {
        //метод для записи массива категорий
        SET_VALIDATION_ERROR_UPLOAD(state, errors) {
            state.validationError = errors.photo_file ? errors.photo_file[0] : '';
        },

        SET_STATUS_UPLOAD(state, status) {
            state.status = status;
        },
    },

    //обновляем и выводим данные
    getters: {
        //обновляет и возвращает список категорий
        VALIDATION_ERROR_UPLOAD: state => state.validationError,
        STATUS_UPLOADED: state => state.status,
    }
}