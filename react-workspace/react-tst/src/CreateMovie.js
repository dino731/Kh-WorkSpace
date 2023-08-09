const CreateMovie = (props) =>{
  const {newMovie, onAddMovie, onInputChange} = props;

  return(
    <div>
      <h1>Create Movie</h1>
      <form>
          <input 
            type="number"
            name="id"
            value={newMovie.id}
            onChange={onInputChange}
            placeholder="input movie id"
          />
          <br/>
          <input 
            type="text"
            name="title"
            value={newMovie.title}
            onChange={onInputChange}
            placeholder="input movie title"
          />
          <br/>
          <input 
              type="text"
              name="genre"
              value={newMovie.genre}
              onChange={onInputChange}
              placeholder="input movie genre"
            />
          <br/>
          <label>출시일 : </label>
          <input 
              type="date"
              name="release_date"
              value={newMovie.release_date}
              onChange={onInputChange}
            />
          <br/>
      </form>
      <button onClick={onAddMovie}>Add Movis</button>


    </div>

    

  )
}
export default CreateMovie;