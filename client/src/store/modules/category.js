export default {
    //данные
    state: {
        category: [], //массив категорий
    },

    //принимаем данные
    actions: {
        //вывод категорий
        async GET_CATEGORY_FROM_API({commit}) {
            try {
                //запрос на сервер
                const res = await fetch('http://store/public/api/category' , {
                    method: 'get',
                })

                //принимаем данные с сервера
                const category = await res.json()

                //записываем данные в хранилище
                commit('SET_CATEGORY_TO_STATE', category.data)
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
        SET_CATEGORY_TO_STATE(state, category) {
            state.category = category
        },
    },

    //обновляем и выводим данные
    getters: {
        //обновляет и возвращает список категорий
        CATEGORY(state) {
            return state.category
        }
    }
}