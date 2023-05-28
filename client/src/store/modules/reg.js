export default {
    //данные
    state: {
        isReg: false,
        validationError: {
            'surname': '',
            'name': '',
            'patronymic': '',
            'telephone': '',
            'login': '',
            'password': '',
            'photo': '',
            'reg': '',
        },
    },

    //принимаем данные
    actions: {
        //функция регистрации
        async onReg({commit}, [surname, name, patronymic, telephone, login, password, photo]) {
            try {
                //запрос на сервер
                const res = await fetch('http://store/public/api/reg', {
                    method: 'post',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        surname: surname,
                        name: name,
                        patronymic: patronymic,
                        telephone: telephone,
                        login: login,
                        password: password,
                        photo: photo,
                    })
                })

                //принимаем данные с сервера
                const reg = await res.json()

                //записываем данные в хранилище
                if (reg.data) {
                    commit('SET_VALIDATION_ERROR_REG', '')
                    commit('SET_VALIDATION_ERROR_INPUT', [])
                    commit('SET_IS_REG', true)
                }

                if (reg.error) {
                    commit('SET_VALIDATION_ERROR_REG', reg.error.message)
                    commit('SET_VALIDATION_ERROR_INPUT', reg.error.errors)
                }
            }

            //если запрос не сработал выводим ошиибки в консоль
            catch (err) {
                console.log(err);
                commit('SET_VALIDATION_ERROR_INPUT', [])
                commit('SET_VALIDATION_ERROR_REG', 'Ошибка регистрации!')
            }
        },
    },

    //изменяем данные
    mutations: {
        SET_VALIDATION_ERROR_INPUT(state, errors) {
            console.log(errors)
            state.validationError.name = errors.name ? errors.name[0] : null;
            state.validationError.surname = errors.surname ? errors.surname[0] : null;
            state.validationError.patronymic = errors.patronymic ? errors.patronymic[0] : null;
            state.validationError.login = errors.login ? errors.login[0] : null;
            state.validationError.password = errors.password ? errors.password[0] : null;
            state.validationError.telephone = errors.telephone ? errors.telephone[0] : null;
            state.validationError.photo = errors.photo ? errors.photo[0] : null;
        },

        SET_VALIDATION_ERROR_REG(state, error) {
            state.validationError.reg = error;
        },

        SET_IS_REG(state, bool) {
            state.isReg = bool
        }
    },

    //обновляем и выводим данные
    getters: {
        //обновляет и возвращает ошибки валидации полей
        VALIDATION_ERROR_REG(state) {
            return state.validationError
        },

        IS_REG(state) {
            return state.isReg
        }
    }
}